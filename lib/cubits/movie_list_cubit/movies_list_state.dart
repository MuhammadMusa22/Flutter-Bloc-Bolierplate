part of 'movies_list_cubit.dart';

@immutable
abstract class MoviesListState {}

class MoviesListInitial extends MoviesListState {}

class MoviesListLoading extends MoviesListState {}

class MoviesListError extends MoviesListState {
  final String message;

  MoviesListError({required this.message});
}

class MoviesLoaded extends MoviesListState {
  final List<Result> movies;

  MoviesLoaded({required this.movies});
}
