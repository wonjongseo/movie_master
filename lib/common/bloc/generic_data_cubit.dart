import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_report_app/common/bloc/generic_data_state.dart';
import 'package:movie_report_app/core/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase usecase, {dynamic params}) async {
    var result = await usecase.call(params: params);
    result.fold(
      (error) => emit(FailureLoadData(errorMessage: error)),
      (data) => emit(DataLoaded<T>(data: data)),
    );
  }
}
