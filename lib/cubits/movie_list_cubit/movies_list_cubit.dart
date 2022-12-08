import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tazah_tech_sale/data/models/movie.dart';
import 'package:tazah_tech_sale/data/repositories/movie_repository.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit() : super(MoviesListInitial());

  MovieRepository movieRepository = MovieRepository();

  getMoviesList() async {
    dynamic moviesResponse = await movieRepository.fetchMovieList();
    if(moviesResponse is Movies){
      List<Result> movies=moviesResponse.results;
      emit(MoviesLoaded(movies: movies));
    }else{
      Exception e=moviesResponse as Exception;
      emit(MoviesListError(message: e.toString()));
    }

  }
}
