import 'package:admin_app_foodi/Model/Models/SectionModel.dart';
import 'package:flutter/material.dart';

import '../../Utils/AppColor.dart';
import '../Components/CustomText.dart';
class SectionWidget extends StatelessWidget {

  final SectionModel item;
  const SectionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height:30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.lightOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  CustomText(text:"${item.sectionName}", fontSize: 20 , fontWeight: FontWeight.bold,),
                  Image.asset(item.sectionImage! ,),
                ],),
            ),
          ),
        ),
      ],
    );

  }
}
