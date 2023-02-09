import 'package:bloc/bloc.dart';
import 'package:chart_projects/src/modals/data.dart';
import 'package:chart_projects/src/services/service.dart';
import 'package:equatable/equatable.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Dataloading()) {
    on<DataEvent>((event, emit) async {
      final service = Service();
      try {
        Dataloading();
        List<Data> datalist;
        datalist = await service.getcoinprice();
        emit(Dataloaded(datalist: datalist));
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
