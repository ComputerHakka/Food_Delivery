import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/menu.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterLoadingState()) {
    on<FilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
