import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mediezy_task/core/common_widgets/custom_app_bar.dart';
import 'package:mediezy_task/core/common_widgets/custom_text.dart';
import 'package:mediezy_task/core/config/di/injection.dart';
import 'package:mediezy_task/core/constants/app_colors.dart';
import 'package:mediezy_task/core/services/storage_services.dart';
import 'package:mediezy_task/core/utils/calculations.dart';

class MyRouteMapScreen extends StatefulWidget {
  final double startLat;
  final double startLng;
  final double endLat;
  final double endLng;

  const MyRouteMapScreen({
    super.key,
    required this.startLat,
    required this.startLng,
    required this.endLat,
    required this.endLng,
  });

  @override
  State<MyRouteMapScreen> createState() => _MyRouteMapScreenState();
}

class _MyRouteMapScreenState extends State<MyRouteMapScreen> {
  GoogleMapController? _mapController;
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    // Load the custom map style
    rootBundle.loadString('assets/map_style.json').then((style) {
      _mapStyle = style;
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (_mapStyle != null) {
      controller.setMapStyle(_mapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final start = LatLng(widget.startLat, widget.startLng);
    final end = LatLng(widget.endLat, widget.endLng);
    final distanceKm = calculateDistance(
      widget.startLat,
      widget.startLng,
      widget.endLat,
      widget.endLng,
    );

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated, // ← apply style here
            initialCameraPosition: CameraPosition(target: start, zoom: 14),
            markers: {
              Marker(
                markerId: const MarkerId("start"),
                position: start,
                infoWindow: const InfoWindow(title: "Mark In"),
              ),
              Marker(
                markerId: const MarkerId("end"),
                position: end,
                infoWindow: const InfoWindow(title: "Mark Out"),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: [start, end],
                color: AppColors.textClr,
                width: 4,
              ),
            },
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false, // hides the Google Maps toolbar
            compassEnabled: false, // cleaner look
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: CustomAppBar(showText: true, text: "My Route"),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText(
                    sl<StorageService>().userName ?? "",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  customText(
                    "${distanceKm.toStringAsFixed(1)} Km",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  Image.asset("assets/images/reload.png", height: 35.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
