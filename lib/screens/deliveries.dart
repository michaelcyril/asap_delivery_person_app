import 'package:delivery_rider_app/components/accepted_order_component.dart';
import 'package:flutter/material.dart';

class Deliveries extends StatefulWidget {
  const Deliveries({super.key});

  @override
  State<Deliveries> createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries> {
  var data = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: data
            .map((e) => const AcceptedOrderComponent(
                orderID: "3",
                name: "Sharwarma",
                location: "Sinza",
                orderArrivalTime: "30-12-2023"))
            .toList(),
      )),
    );
  }
}
