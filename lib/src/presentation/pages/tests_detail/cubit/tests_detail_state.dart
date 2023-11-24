part of 'tests_detail_cubit.dart';

sealed class TestsDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

final class TestsDetailInitial extends TestsDetailState {}

final class TestsDetailLoading extends TestsDetailState {}

final class TestsDetailSuccessful extends TestsDetailState {
  final Prueba tests;

  TestsDetailSuccessful({required this.tests});
}

final class TestsDetailFailure extends TestsDetailState {
  final String message;

  TestsDetailFailure({required this.message});
}