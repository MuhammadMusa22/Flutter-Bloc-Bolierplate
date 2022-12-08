part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movieDetails;
  MovieDetailsLoaded({required this.movieDetails});
}

class MoviesDetailsError extends MovieDetailsState {
  final String message;

  MoviesDetailsError({required this.message});
}


