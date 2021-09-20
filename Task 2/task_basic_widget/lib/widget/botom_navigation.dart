import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigation() {
  return BottomNavigationBar(
    iconSize: 32,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    currentIndex: 4,
    selectedIconTheme: IconThemeData(color: Colors.white),
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.movie_filter_outlined),
        label: 'IG Tv',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.card_travel_outlined),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'User',
      ),
    ],
  );
}
