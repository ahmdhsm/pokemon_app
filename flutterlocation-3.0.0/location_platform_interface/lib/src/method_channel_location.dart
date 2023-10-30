// File created by
// Lung Razvan <long1eu>
// on 23/03/2020

part of location_platform_interface;

/// The interface that implementations of `location` must extend.
///
/// Platform implementations should extend this class rather than implement it
/// as `location` does not consider newly added methods to be breaking
/// changes. Extending this class (using `extends`) ensures that the subclass
/// will get the default implementation, while platform implementations that
/// `implements` this interface will be broken by newly added
/// [LocationPlatform] methods.
class MethodChannelLocation extends LocationPlatform {
  /// Initializes the plugin and starts listening for potential platform events.
  factory MethodChannelLocation() {
    if (_instance == null) {
      const MethodChannel methodChannel = MethodChannel('lyokone/location');
      const EventChannel eventChannel = EventChannel('lyokone/locationstream');
      _instance = MethodChannelLocation.private(methodChannel, eventChannel);
    }
    return _instance;
  }

  /// This constructor is only used for testing and shouldn't be accessed by
  /// users of the plugin. It may break or change at any time.
  @visibleForTesting
  MethodChannelLocation.private(this._methodChannel, this._eventChannel);

  static MethodChannelLocation _instance;

  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  Stream<LocationData> _onLocationChanged;

  /// Change settings of the location request.
  ///
  /// The [accuracy] argument is controlling the precision of the
  /// [LocationData]. The [interval] and [distanceFilter] are controlling how
  /// often a new location is sent through [onLocationChanged].
  @override
  Future<bool> changeSettings({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int interval = 1000,
    double distanceFilter = 0,
  }) async {
    final int result = await _methodChannel.invokeMethod(
      'changeSettings',
      <String, dynamic>{
        'accuracy': accuracy.index,
        'interval': interval,
        'distanceFilter': distanceFilter
      },
    );

    return result == 1;
  }

  /// Gets the current location of the user.
  ///
  /// Throws an error if the app has no permission to access location.
  /// Returns a [LocationData] object.
  @override
  Future<LocationData> getLocation() async {
    final Map<String, double> resultMap =
        await _methodChannel.invokeMapMethod('getLocation');
    return LocationData.fromMap(resultMap);
  }

  /// Checks if the app has permission to access location.
  ///
  /// If the result is [PermissionStatus.deniedForever], no dialog will be
  /// shown on [requestPermission].
  /// Returns a [PermissionStatus] object.
  @override
  Future<PermissionStatus> hasPermission() async {
    final int result = await _methodChannel.invokeMethod('hasPermission');
    switch (result) {
      case 0:
        return PermissionStatus.denied;
        break;
      case 1:
        return PermissionStatus.granted;
        break;
      case 2:
        return PermissionStatus.deniedForever;
      default:
        throw PlatformException(code: 'UNKNOWN_NATIVE_MESSAGE');
    }
  }

  /// Checks if the app has permission to access location.
  ///
  /// If the result is [PermissionStatus.deniedForever], no dialog will be
  /// shown on [requestPermission].
  /// Returns a [PermissionStatus] object.
  @override
  Future<PermissionStatus> requestPermission() async {
    final int result = await _methodChannel.invokeMethod('requestPermission');

    switch (result) {
      case 0:
        return PermissionStatus.denied;
        break;
      case 1:
        return PermissionStatus.granted;
        break;
      case 2:
        return PermissionStatus.deniedForever;
      default:
        throw PlatformException(code: 'UNKNOWN_NATIVE_MESSAGE');
    }
  }

  /// Checks if the location service is enabled.
  @override
  Future<bool> serviceEnabled() async {
    final int result = await _methodChannel.invokeMethod('serviceEnabled');
    return result == 1;
  }

  /// Request the activation of the location service.
  @override
  Future<bool> requestService() async {
    final int result = await _methodChannel.invokeMethod('requestService');
    return result == 1;
  }

  /// Returns a stream of [LocationData] objects. The frequency and accuracy of
  /// this stream can be changed with [changeSettings]
  ///
  /// Throws an error if the app has no permission to access location.
  @override
  Stream<LocationData> get onLocationChanged {
    return _onLocationChanged ??= _eventChannel
        .receiveBroadcastStream()
        .map<LocationData>((dynamic element) =>
            LocationData.fromMap(Map<String, double>.from(element)));
  }
}
