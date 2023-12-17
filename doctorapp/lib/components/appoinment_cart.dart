import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class AppoinmentCard extends StatefulWidget {
  const AppoinmentCard({Key? key}) : super(key: key);

  @override
  State<AppoinmentCard> createState() => _AppoinmentCardState();
}

class _AppoinmentCardState extends State<AppoinmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor_1.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr Richard Tan',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ]),
          )),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(children: [
        const Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Monday, 11/23/1999',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.access_alarm,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
            child: Text(
          '2:00 PM',
          style: TextStyle(color: Colors.white),
        ))
      ]),
    );
  }
}