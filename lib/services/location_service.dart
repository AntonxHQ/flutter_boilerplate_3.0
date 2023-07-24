import 'package:antonx_flutter_boilerplate_3/app/app.logger.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  final log = getLogger('LocationService');

  Position? currentLocation;
  double? latitude;
  double? longitude;
  Future<Position?> getCurrentLocation() async {
    // Test if location services are enabled.
    LocationPermission permission = await Geolocator.checkPermission();
    // Location services are not enabled don't continue
    // accessing the position and request users
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
          Exception('Location permissions are permanently denied.'),
        );
      }
    }

    // ignore: unrelated_type_equality_checks
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error(Exception('Location permissions are denied.'));
    }

    currentLocation = await Geolocator.getCurrentPosition();
    log.d(
        'Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}');
    return currentLocation;
  }

  Future<String> getAddressFromLatLng(LatLng? location) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          location!.latitude, location.longitude);

      Placemark place = placeMarks[0];

      String address = '';
      if (place.thoroughfare != null && place.thoroughfare != '') {
        address += '${place.thoroughfare}, ';
      }
      if (place.subLocality != null && place.subLocality != '') {
        address += '${place.subLocality}, ';
      }
      if (place.locality != null && place.locality != '') {
        address += '${place.locality}, ';
      }
      if (place.country != null && place.country != '') {
        address += '${place.country}';
      }
      // Remove any trailing commas or whitespace
      address = address.replaceAll(RegExp(r',\s*$'), '');
      return address;
    } catch (e) {
      log.d("@getAddressFromLatLng Error $e");
      return '';
    }
  }

  Future<String> getUserLocalityFromLatLng(LatLng? location) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          location!.latitude, location.longitude);

      Placemark place = placeMarks[0];
      log.d(
        "the location is  ${place.thoroughfare}"
        " ${place.subLocality}"
        " ${place.locality}"
        " ${place.country}",
      );
      return "${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.country}";
    } catch (e) {
      log.d("the exception is $e");
      return '';
    }
  }
}
