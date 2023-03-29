// import 'package:geolocator/geolocator.dart';

import '../../../core.dart';

class DataPerjalananPenumpang extends StatefulWidget {
  final int idKendaraan;
  final LatLng latlng1;
  final LatLng latLng2;
  final LatLng latLngBus;
  final LatLng cameraPosition;
  const DataPerjalananPenumpang(
      {Key key,
      this.latlng1,
      this.latLng2,
      this.cameraPosition,
      this.idKendaraan,
      this.latLngBus})
      : super(key: key);

  @override
  _DataPerjalananPenumpangState createState() =>
      _DataPerjalananPenumpangState();
}

class _DataPerjalananPenumpangState extends State<DataPerjalananPenumpang> {
  InfinitListRepository repo = InfinitListRepository();
  final Completer<GoogleMapController> controller = Completer();
  LatLng sourceLocation;
  LatLng locationBus;
  LatLng destination;
  List<LatLng> polylineCoordinates = [];
  LocationData currentLocation;
  Timer timer;
  int idkendaraan;
  bool terminate = false;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    idkendaraan = widget.idKendaraan;
    print('idkendaraan :: $idkendaraan');
    sourceLocation = widget.latlng1;
    locationBus = widget.latLngBus;
    // print('sourceLocation :: $sourceLocation');
    destination = widget.latLng2;
    // print('destination :: $destination');
    callMehtod();
    getPolyPoints();
    getCurrentLocation();
    setCustomMarkerIcon();
    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/icons/armada.png",
    ).then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  Future<void> callMehtod() async {
    timer = Timer.periodic(Duration(minutes: 1), (timer) async {
      if (terminate != true) {
        print('hello call periodic...');
        var data = await repo.listData(KENDARAAN_BY_ID_URL + '$idkendaraan');
        final decode = json.decode(data);
        // print('decode lokasi kendaraan :: $decode');
        print('lat :: ${decode['latitude']}');
        print('lng :: ${decode['longitude']}');
        GoogleMapController googleMapController = await controller.future;
        if (mounted) {
          setState(() {
            locationBus = LatLng(
              double.tryParse(decode['latitude']),
              double.tryParse(decode['longitude']),
            );
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 13.5,
                  target: LatLng(
                    double.tryParse(decode['latitude']),
                    double.tryParse(decode['longitude']),
                  ),
                ),
              ),
            );
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  void getPolyPoints() async {
    // print('sourceLocation.latitude :: ${sourceLocation.latitude}');
    // print('sourceLocation.longitude :: ${sourceLocation.longitude}');
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBwC_v8D2MP2yQ0oSnlzgR37r1AMX6S538', // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      if (mounted) {
        setState(() {});
      }
    }
  }

  void getCurrentLocation() async {
    print('searching location...');
    Location location = Location();
    print('location :: $location');
    location.getLocation().then(
      (location) {
        setState(() {
          currentLocation = location;
        });
      },
    );
    // GoogleMapController googleMapController = await controller.future;
    // location.onLocationChanged.listen(
    //   (newLoc) {
    //     if (mounted) {
    //       setState(() {
    //         currentLocation = newLoc;
    //         googleMapController.animateCamera(
    //           CameraUpdate.newCameraPosition(
    //             CameraPosition(
    //               zoom: 13.5,
    //               target: LatLng(
    //                 newLoc.latitude,
    //                 newLoc.longitude,
    //               ),
    //             ),
    //           ),
    //         );
    //       });
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarPenumpang('Live Location', () {
          if (mounted) {
            setState(() {
              terminate = true;
              Get.offAll(() => HomePenumpang());
            });
          }
        }),
        body: currentLocation == null
            ? Center(child: Text("Loading"))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: widget.cameraPosition,
                  zoom: 10,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("Bus"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(200),
                    position:
                        LatLng(locationBus.latitude, locationBus.longitude),
                  ),
                  Marker(
                    markerId: MarkerId("Penumpang"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(80),
                    position: LatLng(
                        currentLocation.latitude, currentLocation.longitude),
                  ),
                  Marker(
                    markerId: MarkerId("Source"),
                    position: widget.latlng1,
                  ),
                  Marker(
                    markerId: MarkerId("Destination"),
                    position: widget.latLng2,
                  ),
                },
                onMapCreated: (mapController) {
                  controller.complete(mapController);
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("route"),
                    points: polylineCoordinates,
                    color: const Color(0xFF7B61FF),
                    width: 6,
                  ),
                },
              ),
      ),
    );
  }
}
