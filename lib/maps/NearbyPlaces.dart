import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class NearbyPlacesWidget extends StatefulWidget {
  @override
  _NearbyPlacesWidgetState createState() => _NearbyPlacesWidgetState();
}

class _NearbyPlacesWidgetState extends State<NearbyPlacesWidget> {
  List<Place> nearbyPlaces = [];

  @override
  void initState() {
    super.initState();
    fetchNearbyPlaces();
  }

  Future<void> fetchNearbyPlaces() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final latitude = position.latitude;
    final longitude = position.longitude;
    final radius = 10000; // Specify the radius in meters

    final url =
        'https://overpass-api.de/api/interpreter?data=[out:json];node(around:$radius,$latitude,$longitude);out;';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final elements = data['elements'];

      List<dynamic> elementsList = elements != null ? List.from(elements) : [];
      List<Place> places = [];

      for (var element in elementsList) {
        if (element['tags'] != null) {
          print(element); // Print the element details
          if (element['tags']['name'] != null) {
            String name = element['tags']['name'];
            print('Name: $name'); // Print the 'name' field
            String phone = element['tags']['phone']??'Contact Unavailable';
            places.add(
              Place(
                name: name,
                latitude: element['lat'],
                longitude: element['lon'],
                phone:phone,
                address:element['tags']['addr:full']??'Address Unavailable',
              ),
            );
          }
        }
      }

      setState(() {
        nearbyPlaces = places;
      });
    }
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: EdgeInsets.all(10),
  //         child: Column(
  //           children: [
  //             for(int i=0;i<=nearbyPlaces.length;i++){
  //
  //             }
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nearbyPlaces.length,
      itemBuilder: (BuildContext context, int index) {
        final place = nearbyPlaces[index];
        return Padding(padding: EdgeInsets.all(10),
            child:Material(
              borderRadius: BorderRadius.circular(10),
          elevation: 4,
          color: Colors.white,
          child:MaterialButton(
          onPressed: () {  },
          child: ListTile(
            title: Text(place.name, style: TextStyle(fontWeight: FontWeight.w900,
                fontFamily: 'Arimo',
                color: Colors.black,
                fontSize: 15),),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  'Address: ${place.address}',style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Arimo',
                    color: Colors.black,
                    fontSize: 10),),
                SizedBox(height: 5,),
                Text(
                  'Phone: ${place.phone}',style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Arimo',
                    color: Colors.black,
                    fontSize: 10),)

              ],
            ),
          Text('')

              ]
            )
          ),
          )
        )
        );
      },
    );
  }
}

class Place {
  final String name;
  final double latitude;
  final double longitude;
  final String phone;
  final String address;

  Place({required this.address,required this.phone,required this.name, required this.latitude, required this.longitude});
}