part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}



// get all Categories States
class LoadingAllCategoriesState extends CategoryState {}
class SuccessAllCategoriesState extends CategoryState {}
class ErrorAllCategoriesState extends CategoryState {}



