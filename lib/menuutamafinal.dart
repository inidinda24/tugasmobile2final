import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tugas_mobile2/halamanlogin.dart';
import 'package:tugas_mobile2/menubantuanfinal.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class menuUtamaFinal extends StatefulWidget {
  const menuUtamaFinal({super.key});

  @override
  State<menuUtamaFinal> createState() => _menuUtamaFinalState();
}

class ItemWidget extends StatefulWidget {
  final int index;
  final String? name;
  final String? imageUrl;
  final String? instagramUrl;
  final String? nim;
  final bool? suka;
  final List<Map<String, dynamic>> carouselData;

  ItemWidget({
    required this.index,
    required this.name,
    required this.imageUrl,
    required this.instagramUrl,
    required this.nim,
    required this.suka,
    required this.carouselData,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  Future<void> _launcher(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("Gagal membuka url : $_url");
    }
  }

  void _toggleFavorite() {
    setState(() {
      if (widget.carouselData[widget.index]["suka"] == false) {
        // Menampilkan pop-up ketika menyukai selama 2 detik
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                alignment: Alignment.center,
                content: Text(
                  'Anda menyukai ' + widget.name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Mooli",
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );

        // Menutup alert setelah 2 detik
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        widget.carouselData[widget.index]["suka"] = true;
      } else {
        // Menampilkan pop-up ketika tidak menyukai selama 2 detik
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                alignment: Alignment.center,
                content: Text(
                  'Anda tidak menyukai ' + widget.name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Mooli",
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );

        // Menutup alert setelah 2 detik
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        widget.carouselData[widget.index]["suka"] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 5,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          height: 100,
          width: 100,
          decoration: new BoxDecoration(
            border: Border.all(
              color: Colors.teal,
              width: 2,
            ),
            shape: BoxShape.circle,
            image: new DecorationImage(
              image: new AssetImage(widget.imageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(widget.name!,
            style:
                GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(widget.nim!, style: GoogleFonts.lexend()),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _launcher(widget.instagramUrl!);
              },
              icon: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                _toggleFavorite();
              },
              icon: Icon(
                (widget.carouselData[widget.index]["suka"])
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.teal,
                size: 32,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _menuUtamaFinalState extends State<menuUtamaFinal> {
  List<Map<String, dynamic>> carouselData = [
    {
      "name": "Dinda Dwi Rahmawaty",
      "imageUrl": "assets/dinda.jpeg",
      "instagramUrl": "https://www.instagram.com/dinda.drr/",
      "nim": "124210049",
      "suka": false
    },
    {
      "name": "Miftakhurokhman",
      "imageUrl": "assets/mifta.jpg",
      "instagramUrl": "https://www.instagram.com/miftakhurokhmann/",
      "nim": "124210058",
      "suka": false
    },
    {
      "name": "Faiz Rosyid Ma'ruf",
      "imageUrl": "assets/faiz.jpeg",
      "instagramUrl": "https://www.instagram.com/_faizrosyid/",
      "nim": "124210011",
      "suka": false
    },
  ];

  int _currentIndex = 0;
  bool tampilanDefault = true;

  bool isRunning = false;
  int totalMilliseconds = 0;
  int pausedMilliseconds = 0; // Tambahkan variabel pausedMilliseconds
  List<String> lapTimes = [];
  late Ticker _ticker;

  void initState() {
    super.initState();
    _ticker = Ticker(_onTick);
  }

  void _onTick(Duration elapsed) {
    setState(() {
      totalMilliseconds = elapsed.inMilliseconds +
          pausedMilliseconds; // Tambahkan pausedMilliseconds
    });
  }

  void startStopTimer() {
    if (!isRunning) {
      _ticker.start();
      setState(() {
        isRunning = true;
      });
    } else {
      pauseTimer();
    }
  }

  void pauseTimer() {
    _ticker.stop();
    setState(() {
      isRunning = false;
      pausedMilliseconds =
          totalMilliseconds; // Simpan totalMilliseconds saat tombol "Pause" ditekan
    });
  }

  void resetTimer() {
    _ticker.stop();
    setState(() {
      totalMilliseconds = 0;
      isRunning = false;
      lapTimes.clear();
      pausedMilliseconds =
          0; // Atur pausedMilliseconds kembali ke 0 saat tombol "Reset" ditekan
    });
  }

  void lapTimer() {
    lapTimes.insert(0, formatTime(totalMilliseconds));
    setState(() {
      lapTimes = lapTimes;
    });
  }

  String formatTime(int milliseconds) {
    int hours = (milliseconds ~/ 3600000) % 24;
    int minutes = (milliseconds ~/ 60000) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    int hundreds = (milliseconds ~/ 10) % 100;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String hundredsStr = hundreds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr.$hundredsStr';
  }

  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "MyStopwatch",
          style:
              TextStyle(fontFamily: "Mooli", color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        height: 900,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/jamPutih.jpg"),
                repeat: ImageRepeat.repeat,
                fit: BoxFit.fitHeight)),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Members",
                  style: TextStyle(
                    fontFamily: 'Mooli',
                    fontSize: 30,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: carouselData.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.white.withOpacity(0.3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.teal),
                                ),
                                child: ItemWidget(
                                  index: index,
                                  name: data["name"],
                                  imageUrl: data["imageUrl"],
                                  instagramUrl: data["instagramUrl"],
                                  nim: data["nim"],
                                  suka: data["suka"],
                                  carouselData: carouselData,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Stopwatch',
                  style: TextStyle(
                    fontFamily: 'Mooli',
                    fontSize: 30,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formatTime(totalMilliseconds),
                            style: GoogleFonts.boogaloo(
                              fontSize: 48.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (!isRunning) {
                          startStopTimer();
                        } else {
                          pauseTimer();
                        }
                      },
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(isRunning ? 'Pause' : 'Start',
                                style: GoogleFonts.lexend(fontSize: 18)),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    ElevatedButton(
                      onPressed: () {
                        resetTimer();
                      },
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Reset',
                                style: GoogleFonts.lexend(fontSize: 18)),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    ElevatedButton(
                      onPressed: () {
                        lapTimer();
                      },
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Lap',
                                style: GoogleFonts.lexend(fontSize: 18)),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: lapTimes
                      .asMap()
                      .map(
                        (index, lapTime) => MapEntry(
                          index,
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Lap ${lapTimes.length - index}: $lapTime',
                                style: GoogleFonts.boogaloo(
                                    fontSize: 18.0, color: Colors.teal),
                              ),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.teal,
        currentIndex: 0,
        onTap: (int index) {
          if (index == 0) {
          } else if (index == 1) {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return menuBantuanFinal();
              }));
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: 'Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
        ],
      ),
    );
  }
}

void _logOut(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => halamanlogin()));
}
