import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/core/failure/failures.dart';

class BaseState<T> extends Equatable {
  const BaseState({
    this.data,
    this.failure,
    this.isLoading = false,
  });

  const BaseState.fail(Failure failure)
      : this(
          isLoading: false,
          failure: failure,
        );

  const BaseState.initial({bool isLoading = false})
      : this(
          isLoading: isLoading,
        );

  const BaseState.loaded(T data)
      : this(
          isLoading: false,
          data: data,
        );

  final T? data;
  final Failure? failure;
  final bool isLoading;

  @override
  List<Object?> get props => [data, failure, isLoading];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return '(Data : $data, IsLoading: $isLoading, Failure: $failure)';
  }

  BaseState<T> copyWith({
    T? data,
    Failure? failure,
    bool? isLoading,
  }) {
    return BaseState<T>(
      data: data ?? this.data,
      failure: failure,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BaseListState<T> extends Equatable {
  final Failure? failure;
  final bool isLoading;
  final List<T> listData;

  const BaseListState({
    required this.listData,
    this.failure,
    this.isLoading = false,
  });

  BaseListState.fail(Failure failure)
      : isLoading = false,
        listData = [],
        failure = failure;

  factory BaseListState.initial({bool isLoading = false}) =>
      const BaseListState(listData: []);

  const BaseListState.loaded(this.listData)
      : isLoading = false,
        failure = null;

  @override
  List<Object?> get props => [listData, failure, isLoading];

  @override
  bool get stringify => true;

  @override
  String toString() => 'Data length: ${listData.length} ${super.toString()}';

  BaseListState<T> copyWith({
    List<T>? listData,
    Failure? failure,
    bool? isLoading,
  }) =>
      BaseListState<T>(
        listData: listData ?? this.listData,
        failure: failure ?? this.failure,
        isLoading: isLoading ?? this.isLoading,
      );

  BaseListState<T> upsertData(T data) {
    final indexOfData = listData.indexOf(data);
    final List<T> updatedList = listData.toList();
    if (indexOfData != -1) {
      updatedList[indexOfData] = data;
    } else {
      updatedList.add(data);
    }
    return copyWith(listData: updatedList);
  }

  bool get hasSuccessData => listData.isNotEmpty && failure == null;
}

class BaseListStreamState<T> extends Equatable {
  const BaseListStreamState({required this.listData, this.failure});

  BaseListStreamState.fail(Failure failure)
      : this(listData: Stream<List<T>>.empty(), failure: failure);

  factory BaseListStreamState.initial() => BaseListStreamState(
        listData: Stream<List<T>>.empty(),
      );

  const BaseListStreamState.loaded(Stream<List<T>> listData)
      : this(listData: listData);

  final Failure? failure;
  final Stream<List<T>> listData;

  @override
  List<Object?> get props => [listData, failure];

  @override
  bool get stringify => true;

  BaseListStreamState copyWith({
    Stream<List<T>>? listData,
    Failure? failure,
  }) {
    return BaseListStreamState(
      listData: listData ?? this.listData,
      failure: failure ?? this.failure,
    );
  }

  bool get hasSuccessData => failure == null;
}
