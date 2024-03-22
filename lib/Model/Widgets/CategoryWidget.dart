import 'package:admin_app_foodi/Model/Models/CategoryModel.dart';
import 'package:flutter/material.dart';

import '../../Utils/AppColor.dart';
import '../Components/CustomText.dart';
class CategoryWidget extends StatelessWidget {
  final CategoryModel item;
  const CategoryWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height/9,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          color: AppColor.lightOrange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(text: item.categoryName! , fontWeight: FontWeight.w500,fontSize: 20,),
            Image.network(item.categoryImage!),
          ],
        ) ,
      ),
    );
  }
}
