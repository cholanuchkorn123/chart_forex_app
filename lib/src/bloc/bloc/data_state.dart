part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class Dataloading extends DataState {}

class Dataloaded extends DataState {
  final List<Data> datalist;
  Dataloaded({required this.datalist});
  @override
  List<Object> get props => [datalist];
}

class Datafailed extends DataState {}
