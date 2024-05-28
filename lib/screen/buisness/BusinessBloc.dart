import 'package:doodleblue_interview_task/screen/buisness/BusinessState.dart';
import 'package:doodleblue_interview_task/service/ApiService.dart';
import 'package:doodleblue_interview_task/utils/StringResource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BusinessEvent.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final ApiService apiService;

  BusinessBloc(this.apiService) : super(BusinessInitial()) {
    on<FetchBusinesses>((event, emit) async {
      emit(BusinessLoading());
      try {
        final businesses = await apiService.fetchBusinesses();
        emit(BusinessLoaded(businesses));
      } catch (e) {
        emit(const BusinessError(StringResource.failedToLoad));
      }
    });
  }
}
