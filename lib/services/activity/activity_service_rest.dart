import '../../app/dependencies.dart';
import '../../models/activity.dart';
import '../rest.dart';
import 'activity_service.dart';

class ActivityServiceRest implements ActivityService {
  RestService get rest => dependency();

  Future<List<Activity>> getactivity() async {
    String temp = 'activity';
    final List json = await rest.get(temp);
    if (json == null || json.length == 0) return null;
    return json.map((jsonItem) => Activity.fromJson(jsonItem)).toList();
  }

  Future<Activity> createnewactivity({Activity activity}) async {
    final json = await rest.post('activity/', data: activity);
    if (json == null || json.length == 0) return null;

    final _user = Activity.fromJson(json);
    return _user;
  }
}
