import 'package:assesment_app/services/moment_api.dart';
import 'package:assesment_app/widgets/schedule_item_widget.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  List<Moment> moments = MomentApi.getMoments();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: createScheduleItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createScheduleItems() {
    List<Widget> widgets = <Widget>[];
    int?
        lastDay; // voor nu op basis van dag, als meer tijd op basis van gehele datum
    for (Moment moment in moments) {
      if (lastDay != null && moment.date.day == lastDay) {
        widgets.add(ScheduleItemWidget(
          moment: moment,
        ));
        widgets.add(SizedBox(height: 10));
      } else {
        lastDay = moment.date.day;
        widgets.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            moment.date.toLocal().toString(),
            // TODO verander naar format Maandag 9 Juli
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, color: Color(0xff7B7B7B)),
          ),
        ));
        widgets.add(ScheduleItemWidget(
          moment: moment,
        ));
        widgets.add(SizedBox(height: 10));
      }
    }
    return widgets;
  }
}
