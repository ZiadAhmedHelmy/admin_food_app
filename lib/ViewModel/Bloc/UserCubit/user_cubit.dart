
import 'package:admin_app_foodi/Model/Models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Utils/CollectionNameFirebase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  List<UserModel> usersDetails =[];

  Future<void>getUsersInfo()async{
    emit(LoadingUsersDetailsState());
    FirebaseFirestore.instance.collection(Collection.users).snapshots().listen((value) {
        usersDetails.clear();
        for(var i in value.docs){
          usersDetails.add(UserModel.fromJason(i.data()));
        }
    });
  }

}
