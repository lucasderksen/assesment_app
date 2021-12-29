import 'package:assesment_app/services/moment_api.dart';
import 'package:flutter/cupertino.dart';

class MomentsProvider with ChangeNotifier {
  List<Moment>? _moments = MomentApi.getMoments();

  List<Moment> get moments => _moments?? [];

  set moments(List<Moment> value) {
    _moments = value;
    notifyListeners();
  }

  setAllMedicineTaken(Moment activeMoment){
    List<Moment> editedMoments = moments;
    for(Moment moment in editedMoments){
      for(Medicine med in moment.medicines!){
        med.taken = true;
      }
    }
    // final test = moments.singleWhere((moment) => moment == activeMoment);
  }
}