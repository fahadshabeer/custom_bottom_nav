import 'package:custom_bottom_nav/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:custom_bottom_nav/view/screens/home_screen.dart';
import 'package:custom_bottom_nav/view/screens/second_screen.dart';
import 'package:custom_bottom_nav/view/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatelessWidget {
   RootScreen({Key? key}) : super(key: key);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("pages"),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          context.read<BottomNavCubit>().switchIndex(index);
        },
        children: const [
          HomeScreen(),
          SecondScreen(),
          ThirdScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 5
        ),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )
        ),
        height: 70,
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return Row(
              children: [
                _tabItem(Icons.home, "Home", 0, selectedIndex),
                _tabItem(Icons.notifications, "Home", 1, selectedIndex),
                _tabItem(Icons.settings, "Home", 2, selectedIndex),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _tabItem(IconData icon, String label, int index, int selectedIndex) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          pageController.jumpToPage(index);
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: index == selectedIndex ? Colors.white : Colors.grey
                  .shade400,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(label, style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.grey
                      .shade400,),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
