import 'package:assesment_app/views/schedule_list_view.dart';
import 'package:flutter/material.dart';

class ScheduleDetailView extends StatefulWidget {
  const ScheduleDetailView({Key? key}) : super(key: key);

  @override
  _ScheduleDetailViewState createState() => _ScheduleDetailViewState();
}

class _ScheduleDetailViewState extends State<ScheduleDetailView> {
  DateTime _chosenDateTimeStart = DateTime.utc(2019, 1, 7);
  DateTime _chosenDateTimeEnd = DateTime.utc(2019, 1, 14);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        IntrinsicWidth(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '7 Jan',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            autocorrect: false,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '7 Jan tot 14 Jan',
                  style: TextStyle(fontSize: 20),
                ),
                // TODO date formatter
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              children: [
                Container(width: MediaQuery.of(context).size.width/2, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Gedurende deze periode 4x medicijnen genomen',style: TextStyle(fontSize: 16),),
                )),
                Container(width: MediaQuery.of(context).size.width/2, child:  Icon(
                  Icons.medical_services,
                  color: Colors.black,
                  size: 64.0,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
