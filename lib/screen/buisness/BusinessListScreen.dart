import 'package:doodleblue_interview_task/screen/buisness/widget/BusinessWidget.dart';
import 'package:doodleblue_interview_task/screen/buisness/widget/ErrorMessageWidget.dart';
import 'package:doodleblue_interview_task/utils/CustomTextStyles.dart';
import 'package:doodleblue_interview_task/utils/StringResource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/ApiService.dart';
import 'BusinessBloc.dart';
import 'BusinessEvent.dart';
import 'BusinessState.dart';

class BusinessListScreen extends StatefulWidget {
  const BusinessListScreen({super.key});

  @override
  State<BusinessListScreen> createState() => _BusinessListScreenState();
}

class _BusinessListScreenState extends State<BusinessListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => BusinessBloc(ApiService())..add(FetchBusinesses()),
          child: BlocBuilder<BusinessBloc, BusinessState>(
            builder: (context, state) {
              if (state is BusinessLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BusinessLoaded) {
               return BusinessWidget(state: state);
              } else if (state is BusinessError) {
                return  ErrorMessageWidget(message: state.message);
              } else {
                return const ErrorMessageWidget(message: StringResource.noBusinessAvailable);
              }
            },
          ),
        ),
      ),
    );
  }
}
