part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterChangedEvent extends FilterEvent {
  final String filter;

  const FilterChangedEvent({required this.filter});
}

class FilterClearEvent extends FilterEvent {
  const FilterClearEvent();
}
