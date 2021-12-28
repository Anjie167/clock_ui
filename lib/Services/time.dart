
import 'package:clock_UI/Utilities/location.dart';

import 'networking.dart';

const apiKey = 'bb9222a3b7e77a2ce4b52142637afb09';
const timeURL1 = 'https://www.timeapi.io/api/Time/current/coordinate?';
const timeURL2 = 'https://www.timeapi.io/api/Time/current/zone?timeZone';

class TimeModel {

  Future<dynamic> getCityTime(String timezone) async {
    timezone = 'Europe/Amsterdam';
    var url = '$timeURL2=$timezone';
    NetworkHelper networkHelper = NetworkHelper(url);
    var timeData = await networkHelper.getData();
    return timeData;
  }


  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    String site = '${timeURL1}latitude=${location.latitude}&longitude=${location.longitude}';
    NetworkHelper networkHelper = NetworkHelper(site);

    var timeData = await networkHelper.getData();
    return timeData;
  }
}