import 'package:delivery_rider_app/constants/constants.dart';
import 'package:flutter/material.dart';

class HistoryOrderComponent extends StatelessWidget {
  const HistoryOrderComponent(
      {super.key,
      required this.orderID,
      required this.name,
      required this.status,
      required this.orderArrivalTime,
      required this.client,
      required this.quantity});

  final String orderID;
  final String name;
  final String client;
  final String quantity;
  final String status;
  final String orderArrivalTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'OrderID: ',
                  style: kTextStyle3,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  orderID,
                  style: kTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Text(
                  'From: ',
                  style: kTextStyle3,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  name,
                  style: kTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Text(
                  'To: ',
                  style: kTextStyle3,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  client,
                  style: kTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Text(
                  'Quantity: ',
                  style: kTextStyle3,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  '$quantity Items',
                  style: kTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  size: 15.0,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  orderArrivalTime,
                  style: kTextStyle2,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  '11:08:33',
                  style: kTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: kTextStyle3,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  status,
                  style: kTextStyle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
