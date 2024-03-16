import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/Models/SectionModel.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());
  static SectionCubit get(context) => BlocProvider.of(context);


  List<SectionModel> SectionList = [
    SectionModel(sectionName: "Categories", sectionImage: "assets/icons/categories.png"),
    SectionModel(sectionName: "Orders", sectionImage: "assets/icons/Orders.png"),
    SectionModel(sectionName: "Menu", sectionImage: "assets/icons/menu.png"),
    SectionModel(sectionName: "Analytics", sectionImage: "assets/icons/analysis.png"),
  ];


}
