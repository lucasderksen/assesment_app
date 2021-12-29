import 'dart:math';

enum IconEnum { alarm, business, bookmark, home, pharmacy, breakfast }

enum CheckboxEnum {
  empty,
  checkedWhite,
  checkedGreen,
}

class Medicine {
  Medicine({
    required this.name,
    this.taken = false,
  });

  String name;
  bool taken;
}

class Moment {
  Moment({
    required this.title,
    required this.icon,
    this.medicines,
    required this.date,
    this.isCollapsed = true,
  });

  String title;
  IconEnum icon;
  List<Medicine>? medicines;
  DateTime date;
  bool isCollapsed;
}

class MomentApi {
  static Random random = new Random();
  static List<Moment>? _moments;

  static Moment _breakfast(int atDay) {
    return Moment(
      title: 'Ontbijt',
      icon: IconEnum.breakfast,
      date: DateTime.utc(2019,1,atDay,8),
      medicines: <Medicine>[
        Medicine(name: "Paracetamol", taken: random.nextBool()),
        Medicine(name: "Vitamine C", taken: random.nextBool())
      ],
    );
  }

  static Moment _lunch(int atDay) {
    return Moment(
      title: 'Lunch',
      icon: IconEnum.home,
      date: DateTime.utc(2019,1,atDay,12),
      medicines: <Medicine>[
        Medicine(name: "Acebutol", taken: random.nextBool())
      ],
    );
  }

  static Moment _atWork(int atDay) {
    return Moment(
      title: 'Op \'t werk',
      icon: IconEnum.business,
      date: DateTime.utc(2019,1,atDay,15),
      medicines: <Medicine>[
        Medicine(name: "Paracetamol", taken: random.nextBool()),
      ],
    );
  }

  static Moment _bedTime(int atDay) {
    return Moment(
      title: 'Voor het slapen',
      icon: IconEnum.alarm,
      date: DateTime.utc(2019,1,atDay,22),
      medicines: <Medicine>[
        Medicine(name: "Paracetamol", taken: random.nextBool()),
        Medicine(name: "Vitamine C", taken: random.nextBool())
      ],
    );
  }

  static List<Moment> getMoments() {
    if (_moments == null) {
      _moments = [
        _breakfast(1),
        _lunch(1),

        _breakfast(2),
        _lunch(2),
        _atWork(2),

        _breakfast(3),
        _lunch(3),

        _breakfast(4),
        _atWork(4),



        _breakfast(6),
        _lunch(6),
        _atWork(6),

        _bedTime(7),

        _breakfast(8),
        _lunch(8),

        _breakfast(9),
        _lunch(9),
        _atWork(9),

        _breakfast(10),
        _lunch(10),

        _breakfast(11),
        _atWork(11),


        _breakfast(13),
        _lunch(13),
        _atWork(13),

        _bedTime(14)


      ];
    }
    return _moments!;
  }
}
