import 'package:assesment_app/services/moment_api.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatefulWidget {
  const CustomListItem({
    Key? key,
    required this.medicine
  }) : super(key: key);

  final Medicine medicine;

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.medicine.taken;
    super.initState();
  }
  @override void didUpdateWidget(covariant CustomListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      this.isChecked = widget.medicine.taken;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: Checkbox(
                activeColor: const Color(0xff8CC34B),
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.medicine.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        "2 stuks, 50 mg",
                        style: TextStyle(
                            color: Colors.black54,
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
    );
  }
}
