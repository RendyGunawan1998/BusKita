// import 'package:geolocator/geolocator.dart';

import '../../../core.dart';

class DataPerjalananDriver extends StatefulWidget {
  final int idKendaraan;
  final LatLng latlng1;
  final LatLng latLng2;
  const DataPerjalananDriver(
      {Key key, this.latlng1, this.latLng2, this.idKendaraan})
      : super(key: key);

  @override
  _DataPerjalananDriverState createState() => _DataPerjalananDriverState();
}

class _DataPerjalananDriverState extends State<DataPerjalananDriver> {
  InfinitListRepository repo = InfinitListRepository();
  final Completer<GoogleMapController> controller = Completer();
  LatLng sourceLocation;
  LatLng destination;
  List<LatLng> polylineCoordinates = [];
  LocationData currentLocation;
  Timer timer;
  int idkendaraan;
  List latlong = [];
  String urlPutLokasi = PUT_LOKASI_DRIVER_URL;
  bool terminate = false;
  bool mulai = false;

  @override
  void initState() {
    getCurrentLocation();
    idkendaraan = widget.idKendaraan;
    print('idkendaraan :: $idkendaraan');
    sourceLocation = widget.latlng1;
    destination = widget.latLng2;
    // callMehtod();
    getPolyPoints();
    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  void getPolyPoints() async {
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
    GoogleMapController googleMapController = await controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        if (mounted) {
          setState(() {
            currentLocation = newLoc;
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 13.5,
                  target: LatLng(
                    newLoc.latitude,
                    newLoc.longitude,
                  ),
                ),
              ),
            );
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarPenumpang(
            // latlong.isNotEmpty ?  '${latlong.toString()}':
            'Perjalanan', () {
          showAlertDialog2Button(context, 'Pemberitahuan',
              'Apakah anda yakin ingin keluar? Jika anda keluar maka perjalanan tidak dapat ditampilkan pada penumpang. Yakin ingin keluar?',
              () {
            setState(() {
              terminate = true;
              Get.offAll(() => HomeDriver());
            });
          });
        }),
        body: currentLocation == null
            ? Center(child: Text("Loading"))
            : GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation.latitude, currentLocation.longitude),
                  zoom: 10,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("Bus"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(200),
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
        floatingActionButton: currentLocation == null
            ? hbox(0)
            : buttonStart(
                mulai == true
                    ? 'Perjalanan Sedang Dimulai'
                    : 'Mulai Perjalanan',
                mulai == true
                    ? () {}
                    : () {
                        setState(() {
                          mulai = true;
                        });
                        timer =
                            Timer.periodic(Duration(minutes: 1), (timer) async {
                          if (terminate != true) {
                            print('hello call periodic...');
                            Location location = Location();
                            print('location :: $location');
                            location.getLocation().then(
                              (location) {
                                setState(() {
                                  currentLocation = location;
                                });
                              },
                            );
                            GoogleMapController googleMapController =
                                await controller.future;
                            location.onLocationChanged.listen(
                              (newLoc) {
                                if (mounted) {
                                  setState(() {
                                    currentLocation = newLoc;
                                    googleMapController.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          zoom: 13.5,
                                          target: LatLng(
                                            newLoc.latitude,
                                            newLoc.longitude,
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                }
                              },
                            );
                            print('new lat :: ${currentLocation.latitude}');
                            print('new lng :: ${currentLocation.longitude}');
                            if (mounted) {
                              setState(() {
                                latlong = [
                                  currentLocation.latitude,
                                  currentLocation.longitude
                                ];
                                print('latlong :: $latlong');
                              });
                            }
                            var data = await repo.putLokasiDriver(
                                judul: 'Put Lokasi Driver',
                                idmobil: idkendaraan,
                                lat: (currentLocation.latitude).toString(),
                                long: (currentLocation.longitude).toString(),
                                url: urlPutLokasi);
                            if (data == 200) {
                              print('data terkirim');
                            }
                          } else {
                            timer.cancel();
                          }
                        });
                      }),
      ),
    );
  }
}
