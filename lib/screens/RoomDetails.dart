import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomDetails extends StatefulWidget {
  final String roomName;
  final String members;

  RoomDetails({this.roomName, this.members});

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  bool isSwitched = false;

  final List roomAssets = [
    {
      "icon": "assets/icons/lamp.png",
      "title": "Lamp",
      "subTitle": "65% brightness",
      "isActive": true
    },
    {
      "icon": "assets/icons/tv.png",
      "title": "TV",
      "subTitle": "32% Volume",
      "isActive": false
    },
    {
      "icon": "assets/icons/air_condition.png",
      "title": "Air Conditioner",
      "subTitle": "24°C Temperature",
      "isActive": true
    },
    {
      "icon": "assets/icons/fridge.png",
      "title": "Fridge",
      "subTitle": "5°C Temperature",
      "isActive": true
    },
    {
      "icon": "assets/icons/cctv.png",
      "title": "CCTV Cam.",
      "subTitle": "Left/Right: 96.4° & Up/Down: 86.2°",
      "isActive": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF8833F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.roomName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.members,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            child: Image.asset('assets/icons/thermometer.png'),
                            radius: 30,
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text('24°C', style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),),
                              Text('TEMP', style: TextStyle(
                                  color: Colors.white,
                              ),),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            child: Image.asset('assets/icons/humidity.png'),
                            radius: 30,
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text('50%', style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Humidity', style: TextStyle(
                                  color: Colors.white,
                              ),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: roomAssets.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(3, 5),
                                blurRadius: 9,
                                spreadRadius: 1)
                          ]),
                      child: ListTile(
                        leading: Image.asset(roomAssets[index]['icon']),
                        title: Text(roomAssets[index]['title']),
                        subtitle: Text(roomAssets[index]['subTitle']),
                        trailing: Switch(
                          value: roomAssets[index]['isActive'],
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Colors.orangeAccent,
                          activeColor: Color(0xFFF8833F),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
