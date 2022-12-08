import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazah_tech_sale/cubits/movie_list_cubit/movies_list_cubit.dart';
import 'package:tazah_tech_sale/data/models/movie.dart';

import 'movie_details_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late MoviesListCubit moviesListCubit;

  @override
  void initState() {
    super.initState();
    moviesListCubit = context.read<MoviesListCubit>();
    moviesListCubit.getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Movies',
          style: TextStyle(
//            color: Colors.lightGreen,
            fontSize: 28,
          ),
        ),
//        backgroundColor: Colors.black54,
      ),
      body: RefreshIndicator(
        onRefresh: () => moviesListCubit.getMoviesList(),
        child: BlocBuilder<MoviesListCubit, MoviesListState>(
          builder: (context, state) {
            if (state is MoviesListLoading) {
              return const Loading(loadingMessage: 'loading');
            } else if (state is MoviesListError) {
              return Error(
                errorMessage: 'error',
                onRetryPressed: () => moviesListCubit.getMoviesList(),
              );
            } else if (state is MoviesLoaded) {
              return MovieList(movieList: state.movies);
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // moviesListCubit.dispose();
    super.dispose();
  }
}

class MovieList extends StatelessWidget {
  final List<Result> movieList;

  const MovieList({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(movieId:movieList[index].id),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w342${movieList[index].posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key? key, required this.errorMessage, required this.onRetryPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text(
              'Retry',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key? key, required this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
//              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}
