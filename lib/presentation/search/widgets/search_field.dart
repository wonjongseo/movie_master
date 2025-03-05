import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/widgets/custom_text_form_field.dart';
import 'package:movie_report_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_report_app/presentation/search/bloc/selectable_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: context.read<SearchCubit>().textEditingController,
      onChanged: (value) {
        context.read<SearchCubit>().search(
              value!,
              context.read<SelectableOptionCubit>().state,
            );
      },
      hintText: '검색...',
    );
  }
}
