import 'package:assesment_app/providers/moments_provider.dart';
import 'package:assesment_app/services/moment_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_list_item.dart';
import 'expanded_section.dart';

import 'package:provider/provider.dart';

class ScheduleItemWidget extends StatefulWidget {
  ScheduleItemWidget(
      {Key? key,
      required this.moment,
      this.isCheckedStartValue = false,
      this.isExpandedStartValue = false})
      : super(key: key);

  final Moment moment;
  final bool isCheckedStartValue;
  final bool isExpandedStartValue;

  @override
  _ScheduleItemWidgetState createState() => _ScheduleItemWidgetState();
}

class _ScheduleItemWidgetState extends State<ScheduleItemWidget> {
  late bool isChecked;
  late bool isExpanded;

  @override
  void initState() {
    isChecked = isAllMedicineTaken();
    isExpanded = widget.isExpandedStartValue;
    super.initState();
  }

  bool isAllMedicineTaken() {
    for (Medicine med in widget.moment.medicines!) {
      if (med.taken == false) {
        return false;
      }
    }
    return true;
  }

  void setAllMedicineTaken(bool changedValue) {
    context.read<MomentsProvider>().setAllMedicineTaken(widget.moment);
    for (Medicine med in widget.moment.medicines!) {
      med.taken = changedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isChecked ? Color(0xff52878F) : Colors.white,
              borderRadius: isExpanded
                  ? BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))
                  : BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Checkbox(
                        activeColor: Colors.white,
                        checkColor: Color(0xff52878F),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                            setAllMedicineTaken(isChecked);
                          });
                        },
                        value: isChecked,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.favorite,
                            color: isChecked ? Colors.white : Colors.black,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          // TODO verander icon naar ander icon met switch case
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.moment.title,
                                style: TextStyle(
                                    color:
                                        isChecked ? Colors.white : Colors.black,
                                    fontSize: 16),
                              ),
                              Text(
                                (widget.moment.date.hour < 10)
                                    ? '0${widget.moment.date.hour}:00'
                                    : '${widget.moment.date.hour}:00',
                                style: TextStyle(
                                    color:
                                        isChecked ? Colors.white : Colors.black,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ExpandedSection(
          child: buildExpanded(),
          expand: isExpanded,
        )
      ],
    );
  }

  Container buildExpanded() {
    List<Widget> widgets = <Widget>[];
    widgets.add(Container(height: 4,color: const Color(0xff8CC34B),));
    widgets.add(SizedBox(height: 10,));
    for(Medicine med in widget.moment.medicines!){
      widgets.add(CustomListItem(medicine: med,));
      widgets.add(SizedBox(height: 10,));
    }

    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8)),
          ),
          child: Column(
            children: widgets,
          ),
        );
  }
}
