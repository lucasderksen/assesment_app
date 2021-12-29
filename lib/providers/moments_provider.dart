import 'package:assesment_app/services/moment_api.dart';
import 'package:flutter/cupertino.dart';

class MomentsProvider with ChangeNotifier {
  List<Moment>? _moments = MomentApi.getMoments();

  List<Moment> get moments => _moments?? [];

  set moments(List<Moment> value) {
    _moments = value;
    notifyListeners();
  }

  setAllMedicineTaken(Moment activeMoment,bool isTaken){
    List<Moment> editedMoments = moments;
    int activeIndex = editedMoments.indexOf(activeMoment);
    editedMoments[activeIndex].medicines!.forEach((med) { med.taken = isTaken; });
    moments = editedMoments;
  }
}