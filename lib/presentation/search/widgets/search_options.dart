import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_report_app/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableOption(
            title: 'Moive',
            isSelected: state == SearchType.movie,
            onTap: () {
              context.read<SelectableOptionCubit>().selectMovie();
              context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableOptionCubit>().state,
                  );
            },
          ),
          const SizedBox(width: 16),
          SelectableOption(
            title: 'TV',
            isSelected:
                context.read<SelectableOptionCubit>().state == SearchType.tv,
            onTap: () {
              context.read<SelectableOptionCubit>().selechTv();
              context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableOptionCubit>().state,
                  );
            },
          )
        ],
      ),
    );
  }
}
