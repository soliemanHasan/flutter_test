import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final CameraPosition initialLocation;
  final bool isSelecting;
  final void Function(LatLng latlang, Uint8List image) onSuccess;

  MapScreen({
    super.key,
    required this.onSuccess,
    this.initialLocation = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    ),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation = LatLng(0, 0);
  Uint8List? _snapshotImage;

  void _selctLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
      
    });
  }

// void tackSnap()async{
//            _controller.complete(controller1);
//                         final Uint8List? uin8list =
//                             await controller1!.takeSnapshot();
//                         setState(() {
//                           _snapshotImage = uin8list;
//                           print("sdddddddddddd$_snapshotImage");
//                         });

// }
  GoogleMapController? controller1;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: _pickedLocation == null
                    ? null
                    : ()  async{
                        final Uint8List? uin8list = await controller1!.takeSnapshot();
          setState(() {
            _snapshotImage = uin8list;
          });
                       
                        widget.onSuccess(_pickedLocation, _snapshotImage!);
                        context.pop();
                      },
                icon: const Icon(Icons.done)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: widget.initialLocation,
                

                
                onMapCreated: (GoogleMapController controller) async {
                  setState(() {
                    controller1 = controller;
                  });
           
                },
                onCameraIdle:  () async {
          // Take a snapshot after the camera has finished moving
                },
          
                
                onTap: widget.isSelecting ? _selctLocation : null,
                markers: _pickedLocation == null
                    ? {}
                    : {
                        Marker(
                          markerId: const MarkerId(
                            'm1',
                          ),
                          position: _pickedLocation,
                        ),
                      },
              ),
            ),
 
          ],
        ),
      ),
    );
  }
}
