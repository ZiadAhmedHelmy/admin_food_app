import 'package:admin_app_foodi/Utils/CollectionNameFirebase.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/Models/dashCardModel.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardInitial());
  static DashBoardCubit get(context) => BlocProvider.of(context);


  List<DashCardModel>cards = [
     DashCardModel("assets/icons/parcel-tracking.png", "32", "Active Orders"),
     DashCardModel("assets/icons/deposit.png","300" , "Generated Revenue")
  ];





}