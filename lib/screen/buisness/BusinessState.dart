import 'package:equatable/equatable.dart';

import '../../data/Business.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  @override
  List<Object> get props => [];
}

class BusinessInitial extends BusinessState {}

class BusinessLoading extends BusinessState {}

class BusinessLoaded extends BusinessState {
  final List<Businesses> businesses;

  const BusinessLoaded(this.businesses);

  @override
  List<Object> get props => [businesses];
}

class BusinessError extends BusinessState {
  final String message;

  const BusinessError(this.message);

  @override
  List<Object> get props => [message];
}
