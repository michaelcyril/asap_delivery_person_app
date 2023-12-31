// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../components/new_order_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final onPressed;
  //For get data from firebase

  Future<List<OrderModel>> allOrders() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("orders").get();
    var orderData =
        snapshot.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
        print(orderData[0].name);
    return orderData;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allOrders();
  }

  @override
  Widget build(BuildContext context) {
    var data = [1,2,3];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: data.map((e) => 
            const NewOrderComponent(
                orderID: '3',
                name: 'Shishi Foods',
                location: 'Tegeta',
                orderArrivalTime: '30 minutes ago',
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}


class OrderModel {
  // final String
  final String orderID;
  final String name;
  final String location;
  final String orderArrivalTime;
  OrderModel({
    required this.orderID,
    required this.name,
    required this.location,
    required this.orderArrivalTime,
  });
  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return OrderModel(
        orderID: data["orderID"],
        name: data["name"],
        location: data["location"],
        orderArrivalTime: data["orderArrivalTime"].toString());
  }
}