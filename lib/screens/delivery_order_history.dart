import 'package:delivery_rider_app/components/history_order_component.dart';
import 'package:flutter/material.dart';

class DeliveryHistory extends StatefulWidget {
  const DeliveryHistory({super.key});

  @override
  State<DeliveryHistory> createState() => _DeliveryHistoryState();
}

class _DeliveryHistoryState extends State<DeliveryHistory> {
  var data = [1, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: data
                .map(
                  (e) => const HistoryOrderComponent(
                      orderID: "1",
                      name: "Shawarma Food",
                      status: "Delivered",
                      orderArrivalTime: "12-01-2024",
                      client: "Michael",
                      quantity: "3"),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
