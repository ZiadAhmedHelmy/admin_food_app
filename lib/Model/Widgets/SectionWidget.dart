import 'package:admin_app_foodi/Model/Models/SectionModel.dart';
import 'package:admin_app_foodi/View/Screens/CategoryScreen/CategorySceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/AppColor.dart';
import '../Components/CustomText.dart';
class SectionWidget extends StatelessWidget {

  final SectionModel item;
  const SectionWidget({super.key, required this.item,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return item.onTap!;
         },))
       },
      child: Column(
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
                    SvgPicture.asset(item.sectionImage!),
                  ],),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
