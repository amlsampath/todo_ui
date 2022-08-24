import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/data/model/todo_model.dart';
import 'package:to_do_app/data/model/weekmodel.dart';
import 'package:to_do_app/ui/add_task/add_task.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<WeekModel> _weekList = [
    WeekModel(
      letter: 'M',
      num: '01',
    ),
    WeekModel(
      letter: 'T',
      num: '02',
    ),
    WeekModel(
      letter: 'W',
      num: '03',
    ),
    WeekModel(
      letter: 'T',
      num: '04',
    ),
    WeekModel(
      letter: 'F',
      num: '05',
    ),
    WeekModel(
      letter: 'S',
      num: '06',
    ),
    WeekModel(
      letter: 'S',
      num: '07',
    ),
  ];

  List<TodoModel> _todoData = [
    TodoModel(
      icon: Icons.call,
      time: '10.00 AM',
      title: 'Team Meetings',
      description: 'Discuss all quetions about nre project',
    ),
    TodoModel(
      icon: Icons.email,
      time: '10.30 AM',
      title: 'Check Mail',
      description: 'In publishing and graphic design, Lorem ipsum',
    ),
    TodoModel(
      icon: Icons.call,
      time: '11.00 AM',
      title: 'Private Call',
      description: 'Discuss all quetions about nre project',
    ),
    TodoModel(
      icon: Icons.meeting_room,
      time: '12.00 AM',
      title: 'Team Meetings',
      description: 'Typeface without relying on meaningful content',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .22,
                  ),
                  Positioned(
                    right: 0,
                    top: -1,
                    left: 0,
                    child: CustomPaint(
                      size: Size(size.width * .9, (size.width * 0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    right: size.width * .04,
                    top: size.height * .03,
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: size.height * .05,
                    left: size.width * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/main_menu.png',
                              width: size.width * .1,
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Icon(
                              Icons.notifications_active_outlined,
                              color: mainColor,
                              size: 35.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * .15,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: size.width * .08,
                        right: size.width * .08,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Task',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddTask()),
                              );
                            },
                            child: Icon(
                              Icons.add_box,
                              size: size.width * .15,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: size.height * .01,
                  left: size.width * .08,
                  right: size.width * .08,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Wensday,01,June',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: size.height * .12,
                  margin: EdgeInsets.only(
                    top: size.height * .01,
                    left: size.width * .04,
                  ),
                  child: ListView.builder(
                    itemCount: _weekList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          width: size.width * .16,
                          margin: EdgeInsets.all(
                            10.0,
                          ),
                          padding: EdgeInsets.all(
                            10.0,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: currentIndex == index ? Colors.white : mainColor,
                              ),
                              color: currentIndex == index ? mainColor : null,
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                          child: Column(
                            children: [
                              Text(
                                '${_weekList[index].num}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: currentIndex == index ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                '${_weekList[index].letter}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: currentIndex == index ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Stack(
                children: [
                  Container(
                    height: size.height,
                    child: CustomPaint(
                      size: Size(size.width, (size.width * 1.3333333333333333).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSBodyCustomPainter(),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: size.width * .85,
                      margin: EdgeInsets.only(top: size.height * .1),
                      height: size.height,
                      child: ListView.builder(
                        itemCount: _todoData.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                width: size.width * .85,
                                padding: EdgeInsets.all(
                                  10.0,
                                ),
                                margin: EdgeInsets.all(
                                  10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                        15.0,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[200],
                                          borderRadius: BorderRadius.circular(
                                            35.0,
                                          )),
                                      child: Icon(
                                        _todoData[index].icon,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          _todoData[index].title,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width: size.width * .4,
                                          child: Text(
                                            _todoData[index].description,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: mainColor,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * .04,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: size.width * .25,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          10.0,
                                        ),
                                        bottomRight: Radius.circular(
                                          10.0,
                                        ),
                                      )),
                                  child: Center(
                                    child: Text(
                                      _todoData[index].time,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RPSBodyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0050000);
    path0.quadraticBezierTo(size.width * 0.0191667, size.height * 0.0506250, size.width * 0.0600000, size.height * 0.0650000);
    path0.quadraticBezierTo(size.width * 0.0775000, size.height * 0.0812500, size.width * 0.2033333, size.height * 0.0750000);
    path0.quadraticBezierTo(size.width * 0.6791667, size.height * 0.0812500, size.width * 0.8433333, size.height * 0.0825000);
    path0.quadraticBezierTo(size.width * 0.9308333, size.height * 0.0906250, size.width, size.height * 0.1650000);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.0050000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4900000, 0);
    path0.lineTo(size.width, size.height * 0.0050000);
    path0.lineTo(size.width, size.height * 0.8300000);
    path0.quadraticBezierTo(size.width * 0.9687500, size.height * 0.5950000, size.width * 0.9300000, size.height * 0.5800000);
    path0.cubicTo(size.width * 0.8781250, size.height * 0.4862500, size.width * 0.7668750, size.height * 0.5487500, size.width * 0.7375000, size.height * 0.4650000);
    path0.cubicTo(size.width * 0.6993750, size.height * 0.3825000, size.width * 0.6906250, size.height * 0.1775000, size.width * 0.6675000, size.height * 0.1300000);
    path0.quadraticBezierTo(size.width * 0.6337500, size.height * 0.0512500, size.width * 0.4875000, size.height * 0.0050000);
    path0.lineTo(size.width * 0.4900000, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
