import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazah_tech_sale/cubits/movie_details_cubit/movie_details_cubit.dart';

import 'movies.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  late MovieDetailsCubit movieDetailsCubit;

  @override
  void initState() {
    log(widget.movieId.toString());
    super.initState();
    movieDetailsCubit=context.read<MovieDetailsCubit>();
    movieDetailsCubit.getMovieDetails(movieId: widget.movieId.toString());
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Loading(loadingMessage: 'loading');
            } else if (state is MoviesDetailsError) {
              return Error(
                errorMessage: 'error',
                onRetryPressed: () => movieDetailsCubit.getMovieDetails(movieId: widget.movieId.toString()),
              );
            } else if (state is MovieDetailsLoaded) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w342${state.movieDetails.posterPath}',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}


