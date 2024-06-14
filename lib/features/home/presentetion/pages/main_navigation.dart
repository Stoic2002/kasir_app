import 'package:flutter/material.dart';
import 'package:kasir_app/core/assets/assets.gen.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/features/history/presentetion/pages/history_page.dart';
import 'package:kasir_app/features/home/presentetion/pages/home_page.dart';
import 'package:kasir_app/features/income/presentetion/pages/income_page.dart';
import 'package:kasir_app/features/profile/presentetion/pages/profile_page.dart';
import 'package:kasir_app/features/transaction/presentetion/pages/new_transaction_page.dart';

class BasicMainNavigationView extends StatefulWidget {
  const BasicMainNavigationView({Key? key}) : super(key: key);

  @override
  State<BasicMainNavigationView> createState() =>
      _BasicMainNavigationViewState();
}

class _BasicMainNavigationViewState extends State<BasicMainNavigationView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    IncomePage(),
    NewTransactionPage(),
    HistoryPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BottomNavigationBar(
                backgroundColor: AppColors.primaryColor,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Assets.icons.home.image(color: Colors.white),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.category.image(color: Colors.white),
                    label: 'Income',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.vector.image(color: Colors.white),
                    label: 'Add',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.bookmark.image(color: Colors.white),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.profile.image(color: Colors.white),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
