part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}


// Orders
class OrdersLoadingState extends OrdersState {}
class OrdersSuccessState extends OrdersState {}
class OrdersErrorState extends OrdersState {}





// Total Revenue
class LoadingRevenueState extends OrdersState {}
class SuccessRevenueState extends OrdersState {}
class ErrorRevenueState extends OrdersState {}
