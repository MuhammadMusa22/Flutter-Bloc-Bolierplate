import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tazah_tech_sale/data/models/movie_details_model.dart';

import '../../data/repositories/movie_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  MovieRepository movieRepository = MovieRepository();

  getMovieDetails({required String movieId}) async {
    dynamic movieDetailsResponse = await movieRepository.fetchMovieDetails(movieId);
    if (movieDetailsResponse is MovieDetails) {
      emit(MovieDetailsLoaded(movieDetails: movieDetailsResponse));
    } else {
      Exception e = movieDetailsResponse as Exception;
      emit(MoviesDetailsError(message: e.toString()));
    }
  }
}
