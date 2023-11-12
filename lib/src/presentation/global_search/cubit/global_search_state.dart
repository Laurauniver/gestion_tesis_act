part of 'global_search_cubit.dart';

class GlobalSearchState extends Equatable {
  const GlobalSearchState({
    required this.getAllParagraph,
    required this.searchParagraph,
    required this.paragraph,
  });

  GlobalSearchState.initial()
      : this(
          getAllParagraph: BaseListState<TesisTableEntity>.initial(),
          searchParagraph: BaseListState<TesisTableEntity>.initial(),
          paragraph: const BaseState<TesisTableEntity?>.initial(),
        );

  final BaseListState<TesisTableEntity> getAllParagraph;
  final BaseListState<TesisTableEntity> searchParagraph;

  final BaseState<TesisTableEntity?> paragraph;

  @override
  List<Object?> get props => [getAllParagraph, searchParagraph, paragraph];

  GlobalSearchState copyWith({
    BaseListState<TesisTableEntity>? getAllParagraph,
    BaseListState<TesisTableEntity>? searchParagraph,
    BaseState<TesisTableEntity?>? paragraph,
  }) {
    return GlobalSearchState(
      getAllParagraph: getAllParagraph ?? this.getAllParagraph,
      searchParagraph: searchParagraph ?? this.searchParagraph,
      paragraph: paragraph ?? this.paragraph,
    );
  }
}
