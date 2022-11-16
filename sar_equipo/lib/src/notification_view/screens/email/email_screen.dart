import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:syncfusion_flutter_maps/maps.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  final Email email;

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

late MapZoomPanBehavior _zoomPanBehavior;
late MapTileLayerController _controller;
late MapLatLng _markerPosition;
//TextEditingController descriptionController = TextEditingController();
final descriptionController = TextEditingController();

double latitude = 0;
double longitude = 0;

String typeERA = "";
String imageN = "";

void updateMarkerChange(Offset position) {
  _markerPosition = _controller.pixelToLatLng(position);
  latitude = _markerPosition.latitude;
  longitude = _markerPosition.longitude;
  if (_controller.markersCount > 0) {
    _controller.clearMarkers();
  }
  _controller.insertMarker(0);
}

class _CustomZoomPanBehavior extends MapZoomPanBehavior {
  _CustomZoomPanBehavior();
  late MapTapCallback onTap;

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerUpEvent) {
      onTap(event.localPosition);
    }
    super.handleEvent(event);
  }
}

typedef MapTapCallback = void Function(Offset position);

class _EmailScreenState extends State<EmailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    if (widget.email.image == "") {
      imageN = imageGlobaAnom;
    } else {
      imageN = widget.email.image;
    }
    _zoomPanBehavior = _CustomZoomPanBehavior()..onTap = updateMarkerChange;
    _controller = MapTileLayerController();
    switch (widget.email.normalPanicAnonymous) {
      case 0:
        typeERA = "Emergencia";
        break;
      case 1:
        typeERA = "Reportes";
        break;
      case 2:
        typeERA = "Anonimo";
        break;
    }
    actual = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: Image.memory(
                                base64Decode(imageN),
                                width: 190,
                                fit: BoxFit.fitWidth)
                            .image,
                      ),
                      SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: widget.email.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                          children: [
                                            TextSpan(
                                                text: "     " +
                                                    widget.email.mail +
                                                    "\n",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        widget.email.type,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  DateTime.parse(widget.email.time)
                                          .hour
                                          .toString() +
                                      ":" +
                                      DateTime.parse(widget.email.time)
                                          .minute
                                          .toString() +
                                      " / " +
                                      DateTime.parse(widget.email.time)
                                          .year
                                          .toString() +
                                      "-" +
                                      DateTime.parse(widget.email.time)
                                          .month
                                          .toString() +
                                      "-" +
                                      DateTime.parse(widget.email.time)
                                          .day
                                          .toString(),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            SizedBox(height: kDefaultPadding),
                            LayoutBuilder(
                              builder: (context, constraints) => SizedBox(
                                width: constraints.maxWidth > 850
                                    ? 800
                                    : constraints.maxWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.email.body,
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Color(0xFF4D5875),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: kDefaultPadding),
                                    Row(
                                      children: [
                                        Text(
                                          typeERA,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Download All",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        SizedBox(width: kDefaultPadding / 4),
                                        WebsafeSvg.asset(
                                          "assets/Icons/Download.svg",
                                          height: 16,
                                          color: kGrayColor,
                                        ),
                                      ],
                                    ),
                                    Divider(thickness: 1),
                                    SizedBox(height: kDefaultPadding / 2),
                                    Container(
                                        width: 600,
                                        height: 400,
                                        child: SfMaps(
                                          layers: [
                                            MapTileLayer(
                                              urlTemplate:
                                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                              initialFocalLatLng: MapLatLng(
                                                  widget.email.latitude,
                                                  widget.email.longitude),
                                              initialZoomLevel: 14,
                                              zoomPanBehavior: _zoomPanBehavior,
                                              controller: _controller,
                                              markerBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return MapMarker(
                                                    latitude:
                                                        widget.email.latitude,
                                                    longitude:
                                                        widget.email.longitude,
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ));
                                              },
                                            ),
                                          ],
                                        )),
                                    SizedBox(height: kDefaultPadding),
                                    Row(
                                      children: [
                                        Text(
                                          "Imagen Informativa",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Spacer(),
                                        Text(
                                          "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        )
                                      ],
                                    ),
                                    Divider(thickness: 1),
                                    SizedBox(height: kDefaultPadding / 2),
                                    if (widget.email.notificationImage != "")
                                      Image.memory(
                                        base64Decode(widget
                                            .email.notificationImage
                                            .toString()),
                                        height: 400,
                                        fit: BoxFit.fitWidth,
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
