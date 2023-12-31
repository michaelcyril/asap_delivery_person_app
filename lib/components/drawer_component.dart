// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, unused_field, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:delivery_rider_app/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:delivery_rider_app/constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

String imagePath = 'images/img.png';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = pickedFile != null ? File(pickedFile.path) : null;
      });
    }

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 90.0, left: 10.0),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Circular Image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kBackgroundColor,
                    width: 2.0,
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/img.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: SizedBox(
              height: 10.0,
              width: 5.0,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'mike71',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'michaelcyril88@gmail.com',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              '+255693333333',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              'Kimara',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          ListTile(
            onTap: () {
              _showDialog(context);
            },
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout confirmation'),
          content:
              const Text('Are you sure you want to logout from the system?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoginPage(),
                  //   ),
                  // );
                // Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
