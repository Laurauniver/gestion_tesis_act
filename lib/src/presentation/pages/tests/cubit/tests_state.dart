part of 'tests_cubit.dart';

sealed class TestsState extends Equatable {
  //const TestsState();

  @override
  List<Object> get props => [];
}

final class TestsInitial extends TestsState {}

final class TestsLoading extends TestsState{}

final class TestsSuccessful extends TestsState{
   final List<Prueba> tests;

  TestsSuccessful({required this.tests});
}

final class TestsFailure extends TestsState{
  final String message;

  TestsFailure({required this.message});
  
}