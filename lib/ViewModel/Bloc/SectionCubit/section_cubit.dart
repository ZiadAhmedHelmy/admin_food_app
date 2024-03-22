import 'package:admin_app_foodi/View/HomePage.dart';
import 'package:admin_app_foodi/View/Screens/CategoryScreen/CategorySceen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/Models/SectionModel.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());
  static SectionCubit get(context) => BlocProvider.of(context);


  List<SectionModel> SectionList = [
    SectionModel(sectionName: "Categories", sectionImage: "assets/icons/food.svg" ,  CategoryScreen(),),
    SectionModel(sectionName: "Orders", sectionImage: "assets/icons/my-orders.svg", HomePage(),),
    SectionModel(sectionName: "Menu", sectionImage: "assets/icons/food-menu.svg",onTap: () => HomePage()),
    SectionModel(sectionName: "Analytics", sectionImage: "assets/icons/analysis.svg",onTap: () => HomePage()),
  ];


}
