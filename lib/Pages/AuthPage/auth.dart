import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:my_real_estate/Widget/AuthFormWidget/responsvie_login.dart';
import 'package:my_real_estate/Widget/AuthFormWidget/responsvie_register.dart';
import 'package:my_real_estate/Widget/FooterWidget/footer.dart';
import 'package:my_real_estate/Widget/NavbarWidget/drawer.dart';
import 'package:my_real_estate/Widget/NavbarWidget/responsive_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {


  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 950;
    bool isMobile = MediaQuery.of(context).size.width < 600;
    double tabletWidth = MediaQuery.of(context).size.width * 0.7;
    double desktopWidth = MediaQuery.of(context).size.width * 0.4;
    double mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:
          ResponsiveAppBar(isDesktop: isDesktop, height: isDesktop ? 100 : 60),
      drawer: !isDesktop ? const CustomDrawer() : null,
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 248, 246, 246),
          child: DefaultTabController(
            length: 2,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: isDesktop
                        ? desktopWidth
                        : (isMobile ? mobileWidth : tabletWidth),
                    child: const TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(text: 'Login'),
                        Tab(text: 'Register'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const AutoScaleTabBarView(
                    children: [
                      ResponsiveLoginForm(),
                      ResponsiveRegisterForm(),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
