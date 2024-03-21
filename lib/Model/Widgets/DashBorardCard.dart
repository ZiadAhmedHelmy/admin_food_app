import 'package:admin_app_foodi/Model/Models/dashCardModel.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/Orders/orders_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/UserCubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/AppColor.dart';
import '../Components/CustomText.dart';
class DashBoardCard extends StatelessWidget {
  final DashCardModel item;
  const DashBoardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var Order = OrdersCubit.get(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height/5,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // SvgPicture.asset("assets/icons/food-order.svg",width:80,),
                Image.asset(item.image!,width: 100,),
                Flexible(child: CustomText(text: (item.description =='Active Orders' ? Order.activeOrders.length.toString() :item.description=='Generated Revenue' ? OrdersCubit.generatedRevenue.ceilToDouble().toString() :item.description=='Users' ? UserCubit.get(context).usersDetails.length .toString() : "No Users")   ,fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold,)),
              ],
            ),
            CustomText(text: item.description!,fontWeight: FontWeight.w700,fontSize: 20,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
