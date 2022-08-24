import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int currentIndex = 0;
  TextEditingController _taskName = TextEditingController(text: 'Team Meeting');
  TextEditingController _dateController = TextEditingController(text: 'Monday,1 June');
  TextEditingController _startTimeController = TextEditingController(text: '10:00 AM');
  TextEditingController _endTimeController = TextEditingController(text: '11:00 AM');
  TextEditingController _taskDescription = TextEditingController(text: 'Discuss all the questions about new project');
  List<String> _categoryList = ['Development', 'Research', 'Design', 'Implementation', 'QA'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(
            size.width * .05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                  ),
                  Icon(
                    Icons.menu_outlined,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create New Task',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.list_alt_outlined,
                    size: size.width * .1,
                    color: mainColor,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Text(
                'Task Name',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
                textAlign: TextAlign.start,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                )),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: _taskName,
                ),
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Category',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: mainColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Container(
                  height: size.height * .06,
                  child: ListView.builder(
                    itemCount: _categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 10.0,
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
                          child: Center(
                            child: Text(
                              _categoryList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: currentIndex == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: size.height * .025,
              ),
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .6,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                    )),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _dateController,
                    ),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    size: size.width * .15,
                    color: mainColor,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                          )),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                )),
                            controller: _startTimeController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                          )),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                )),
                            controller: _endTimeController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
                textAlign: TextAlign.start,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                )),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: _taskDescription,
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Center(
                child: Container(
                  width: size.width * .6,
                  margin: EdgeInsets.only(
                    right: 10.0,
                  ),
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: mainColor,
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: Center(
                    child: Text(
                      'Create Task',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
