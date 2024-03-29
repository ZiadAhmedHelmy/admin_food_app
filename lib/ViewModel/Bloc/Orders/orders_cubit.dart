import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Model/Models/OrderModel.dart';
import '../../../Utils/CollectionNameFirebase.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  static double generatedRevenue =0;
  List<OrderModel>activeOrders = [];

  Future<void>OrdersData()async{
    emit(OrdersLoadingState());
    await FirebaseFirestore.instance.collection(Collection.orders).snapshots().listen((value) {
          activeOrders.clear();
          for(var i in value.docs){
             activeOrders.add(OrderModel.fromJason(i.data()));
          }
          emit(OrdersSuccessState());
    });


        }

    Future<void>getTotalRevenue()async{
        emit(LoadingRevenueState());
       await FirebaseFirestore.instance.collection(Collection.orders).snapshots().listen((value) {
          for(var i in value.docs){generatedRevenue+=i["Price"];}
          emit(SuccessRevenueState());
          print("Generated Revenue: ${generatedRevenue}");
       });

    }






}
