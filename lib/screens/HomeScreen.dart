import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_home/screens/RoomDetails.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  final List roomData = [
    {
      "roomName": "Living Room",
      "members": "3 family members have access",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Bed Room",
      "members": "3 family members have access",
      "devices": "5 Devices",
      "isActive": true
    },
    {
      "roomName": "Guest Room",
      "members": "2 family members have access",
      "devices": "3 Devices",
      "isActive": false
    },
    {
      "roomName": "Kitchen Room",
      "members": "2 family members have access",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Kids Room",
      "members": "1 family members have access",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Balcony Room",
      "members": "4 family members have access",
      "devices": "2 Devices",
      "isActive": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8833F),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: CircleAvatar(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        backgroundColor: Color(0xFFF8833F),
                        radius: 28,
                      ),
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hi, Muhammad Atif',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Welcome To Home',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.84,
                    ),
                    itemCount: roomData.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RoomDetails(
                                roomName: roomData[index]['roomName'],
                                members: roomData[index]['members'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                roomData[index]['roomName'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                roomData[index]['members'],
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                roomData[index]['devices'],
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFFF8833F)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Switch(
                                value: roomData[index]['isActive'],
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.orangeAccent,
                                activeColor: Color(0xFFF8833F),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
