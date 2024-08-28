part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends CartEvent {
  final MenuEntity menu;
  const AddProductEvent({required this.menu});
}

class RemoveProductEvent extends CartEvent {
  final MenuEntity menu;
  const RemoveProductEvent({required this.menu});
}

class CleanCartEvent extends CartEvent {}
