import 'package:assesment_app/views/schedule_detail_view.dart';
import 'package:assesment_app/views/schedule_list_view.dart';
import 'package:flutter/material.dart';

class ScheduleHomeView extends StatefulWidget {
  const ScheduleHomeView({Key? key}) : super(key: key);

  @override
  _ScheduleHomeViewState createState() => _ScheduleHomeViewState();
}

class _ScheduleHomeViewState extends State<ScheduleHomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff52878F),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.calendar_today),
              ),
              Tab(
                icon: Icon(Icons.calendar_view_week),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ScheduleListView(),
            ScheduleDetailView(),
          ],
        ),
      ),
    );
  }
}
