import 'package:delivery_rider_app/screens/delivery_order_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'material_icon_button.dart';

class AcceptedOrderComponent extends StatelessWidget {
  const AcceptedOrderComponent({
    super.key,
    required this.orderID,
    required this.name,
    required this.location,
    required this.orderArrivalTime,
  });

  final String orderID;
  final String name;
  final String location;
  final String orderArrivalTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Order Number:    ',
                      style: kTextStyle3,
                    ),
                    TextSpan(
                      text: orderID,
                      style: kTextStyle2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'From:    ',
                      style: kTextStyle3,
                    ),
                    TextSpan(
                      text: name,
                      style: kTextStyle2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Order Location: ',
                      style: kTextStyle3,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right:40),
                      child: TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print('clicked');
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              location,
                              style: kTextStyle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Time:    ',
                      style: kTextStyle3,
                    ),
                    TextSpan(
                      text: orderArrivalTime,
                      style: kTextStyle2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:10, right: 10),
                      child: MaterialIconButton(
                        text: '    View',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeliveryOrderDetails(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.view_column),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:10, right: 10),
                      child: MaterialIconButton(
                        text: '    Deliver',
                        onPressed: () {
                          _showDialog(context);
                        },
                        icon: const Icon(Icons.delivery_dining),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delivery confirmation'),
          content: const Text('Are you sure you want to Deliver the order?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
