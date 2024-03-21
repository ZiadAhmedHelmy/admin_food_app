part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

// User STate
class LoadingUsersDetailsState extends UserState {}
class SuccessUsersDetailsState extends UserState {}
class ErrorUsersDetailsState extends UserState {}
