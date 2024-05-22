import 'package:flutter/material.dart';
import 'package:my_real_estate/extensions/hover_extension.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xfff6f6f6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:
                  Image.asset('assets/images/logo.png', width: 200, height: 60)
                      .showCursorOnHover),
          ListTile(
            title: Row(
              children: [Icon(Icons.home), SizedBox(width: 10), Text('Home')],
            ),
            onTap: () {
              context.goNamed('Home Page');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10),
                Text('Listing')
              ],
            ),
            onTap: () {
              context.goNamed('Listing Page');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.article),
                SizedBox(width: 10),
                Text('News'),
              ],
            ),
            onTap: () {
              // Handle tapping News
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.info),
                SizedBox(width: 10),
                Text('About Us'),
              ],
            ),
            onTap: () {
              // Handle tapping About Us
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.contact_phone),
                SizedBox(width: 10),
                Text('Contact'),
              ],
            ),
            onTap: () {
              // Handle tapping Contact
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.login),
                SizedBox(width: 10),
                Text('Login'),
              ],
            ),
            onTap: () {
              context.goNamed('Login Page');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 10),
                Text('Add Property'),
              ],
            ),
            onTap: () {
              // Handle tapping Add Property
            },
          ),
        ],
      ),
    );
  }
}
