import 'package:doctorapp/screens/appoinment_page.dart';
import 'package:doctorapp/screens/articles_page.dart';
//import 'package:doctorapp/screens/edit_profile_page.dart';
import 'package:doctorapp/screens/fav_doctor_page.dart';
import 'package:doctorapp/screens/home_page.dart';
import 'package:doctorapp/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(
            () {
              //update page index when tab press
              currentPage = value;
            },
          );
        }),
        children: [
          HomePage(),
          AppoinmentPage(),
          Favourite_Doctor_Page(),
          ArticleListPage(),
          ProfilePage(),
          //EditProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.animateToPage(
              page,
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.houseChimneyMedical,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidCalendarCheck,
            ),
            label: 'Appoinments',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userDoctor,
            ),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.newspaper,
            ),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
