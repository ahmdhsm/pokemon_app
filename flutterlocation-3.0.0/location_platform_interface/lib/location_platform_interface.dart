library location_platform_interface;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'src/method_channel_location.dart';
part 'src/types.dart';

class LocationPlatform extends PlatformInterface {
  LocationPlatform() : super(token: _token);

  static final Object _token = Object();

  /// The default instance of [LocationPlatform] to use.
  ///
  /// Platform-specific plugins should override this with their own class
  /// that extends [LocationPlatform] when they register themselves.
  ///
  /// Defaults to [MethodChannelLocation].
  static LocationPlatform get instance => _instance;

  static LocationPlatform _instance = MethodChannelLocation();

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [LocationPlatform] when they register themselves.
  static set instance(LocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Change settings of the location request.
  ///
  /// The [accuracy] argument is controlling the precision of the
  /// [LocationData]. The [interval] and [distanceFilter] are controlling how
  /// often a new location is sent through [onLocationChanged].
  Future<bool> changeSettings({
    LocationAccuracy accuracy,
    int interval,
    double distanceFilter,
  }) {
    throw UnimplementedError();
  }

  /// Gets the current location of the user.
  ///
  /// Throws an error if the app has no permission to access location.
  /// Returns a [LocationData] object.
  Future<LocationData> getLocation() {
    throw UnimplementedError();
  }

  /// Checks if the app has permission to access location.
  ///
  /// If the result is [PermissionStatus.deniedForever], no dialog will be
  /// shown on [requestPermission].
  /// Returns a [PermissionStatus] object.
  Future<PermissionStatus> hasPermission() {
    throw UnimplementedError();
  }

  /// Checks if the app has permission to access location.
  ///
  /// If the result is [PermissionStatus.deniedForever], no dialog will be
  /// shown on [requestPermission].
  /// Returns a [PermissionStatus] object.
  Future<PermissionStatus> requestPermission() {
    throw UnimplementedError();
  }

  /// Checks if the location service is enabled.
  Future<bool> serviceEnabled() {
    throw UnimplementedError();
  }

  /// Request the activation of the location service.
  Future<bool> requestService() {
    throw UnimplementedError();
  }

  /// Returns a stream of [LocationData] objects.
  /// The frequency and accuracy of this stream can be changed with
  /// [changeSettings]
  ///
  /// Throws an error if the app has no permission to access location.
  Stream<LocationData> get onLocationChanged {
    throw UnimplementedError();
  }
}
