import 'dart:ffi';

import 'package:admin_app_foodi/Model/Components/CustomText.dart';
import 'package:admin_app_foodi/Model/Models/CategoryModel.dart';
import 'package:admin_app_foodi/Model/Widgets/CategoryWidget.dart';
import 'package:admin_app_foodi/Utils/AppColor.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/CategoryCubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var category = CategoryCubit.get(context);
    return BlocProvider.value(
      value: category..getAllCategoriesFire(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.orange,
          title: CustomText(
            text: "Categories",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.white,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.separated(
                itemBuilder: (context, index) =>
                    CategoryWidget(item: category.categoryList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: category.categoryList.length);
          },
        ),
      ),
    );
  }
}
