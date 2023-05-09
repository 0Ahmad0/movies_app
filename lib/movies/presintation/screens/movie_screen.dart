import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/movies/presintation/controller/movies_bloc.dart';
import '/movies/presintation/controller/movies_event.dart';

import '../../../core/services/services_locator.dart';
import 'widgets/custom_title.dart';
import 'widgets/now_play_section.dart';
import 'widgets/popular_section.dart';
import 'widgets/top_rated_section.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingSection(),
              CustomTitle(
                text: 'Popular',
                onTap: () {},
              ),
              const PopularSection(),
              CustomTitle(
                text: 'Top Rated',
                onTap: () {},
              ),
              const TopRatedSection(),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}
