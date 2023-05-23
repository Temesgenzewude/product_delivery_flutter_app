// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/controllers/location/location_controller.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class LocationDialoguePage extends StatelessWidget {
  final GoogleMapController mapController;
  const LocationDialoguePage({
    Key? key,
    required this.mapController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return Container(
      padding: EdgeInsets.all(AppDimensions.width10),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius10),
        ),
        child: SizedBox(
          width: AppDimensions.screenWidth,
          child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: "Search Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radius10),
                    borderSide: BorderSide(style: BorderStyle.none, width: 0),
                  ),
                  hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: AppDimensions.font16),
                ),
              ),
              suggestionsCallback: (pattern) async {
                /*
                as we type, it gives us suggestion
                */
                return await Get.find<LocationController>()
                    .searchLocation(context, pattern);
              },
              itemBuilder: (context, Prediction suggestion) {
                return Padding(
                  padding: EdgeInsets.all(AppDimensions.width10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Expanded(
                        child: Text(
                          suggestion.description ?? "Addis Ababa Ethiopia",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color,
                                  fontSize: AppDimensions.font16),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onSuggestionSelected: (Prediction suggestion) async {
                await Get.find<LocationController>().setLocation(
                    suggestion.placeId!,
                    suggestion.description!,
                    mapController);

                Get.back();
              }),
        ),
      ),
    );
  }
}
