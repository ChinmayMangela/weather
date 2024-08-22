import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/features/serarch_weather/presentation/pages/search_weather.dart';
import 'package:weather/features/weather_display/presentation/weather_display_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: selectedIndex == 0 ? const WeatherDisplayPage() : const SearchWeather(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.cloud), label: 'Weather'),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search'
      ),
    ]);
  }
}
