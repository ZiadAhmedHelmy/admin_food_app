import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/Models/CategoryModel.dart';
import '../../../Utils/CollectionNameFirebase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

   List<CategoryModel>categoryList = [];

  Future<void>getAllCategoriesFire()async {
    emit(LoadingAllCategoriesState());
    await FirebaseFirestore.instance.collection(Collection.categories).snapshots().listen((value) {
      categoryList.clear();
      for (var doc in value.docs) {
        categoryList.add(CategoryModel.fromJason(doc.data()));
      }
      print(categoryList);
      emit(SuccessAllCategoriesState());
    });
  }
}
