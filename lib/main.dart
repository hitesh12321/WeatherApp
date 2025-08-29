import 'dart:isolate';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/backgroundimage.dart';
import 'package:weather_app/data_services.dart';
import 'package:weather_app/modals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final String _weatherimage = '';
  var _weather = '';
  var _temperature = '';
  var _cityName = '';
  var _iconCode = '';
  final bgImage = Bgi();

  final _controller = TextEditingController();
  final _weatherresponse = DataServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            ' 🍃 WEATHER APP 🍃 ',
            style: GoogleFonts.alata(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 137, 169, 224),
        ),

        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,

              child: Image.asset(
                bgImage.getBackgroundImage(_iconCode),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 900,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: const Color.fromARGB(255, 226, 240, 252),

                            width: 120,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Temp. °C 🌡️",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _temperature,
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Card(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: const Color.fromARGB(255, 226, 240, 252),

                            width: 120,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Weather 👀",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _weather,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: const Color.fromARGB(255, 226, 240, 252),

                            width: 120,
                            height: 100,

                            child: _iconCode.isNotEmpty && _iconCode != ""
                                ? Image.network(
                                    'https://openweathermap.org/img/wn/$_iconCode@2x.png',
                                  )
                                : Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Card(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: const Color.fromARGB(255, 226, 240, 252),

                            width: 120,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "PLACE 📍",
                                  style: GoogleFonts.lexend(fontSize: 17),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _cityName,
                                  style: TextStyle(
                                    fontSize: 32.0,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      cursorColor: Colors.blue,

                      controller: _controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 0,
                        ),

                        hintStyle: TextStyle(
                          color: Colors.black.withAlpha(420),
                        ),
                        fillColor: const Color.fromARGB(
                          66,
                          95,
                          133,
                          152,
                        ).withAlpha(200),
                        hintText: "👉ENTER LOCATION",
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: hii,

                    child: Text(
                      'SEARCH 🔎',
                      style: GoogleFonts.lexendDeca(fontSize: 16),
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

  void hii() async {
    final location = _controller.text.trim();
    if (location.isEmpty) {
      return;
    }

    final response = await _weatherresponse.getWeather(location);
    setState(() {
      _cityName = response?.cityName ?? '';
      _temperature = response?.tempinfo?.temperature ?? '';
      _weather = response?.weatherDescription?.description ?? '';
      _iconCode = response?.weatherDescription?.icon ?? " ";
      print(_iconCode);
    });
  }
}
