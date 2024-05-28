import 'package:flutter/material.dart';

import '../../../utils/CustomTextStyles.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: CustomTextStyles.heading1));
  }
}
