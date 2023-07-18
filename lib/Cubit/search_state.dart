part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {}
class SearchFailureState extends SearchState {}
