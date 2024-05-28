import 'package:flutter/material.dart';

import '../../../data/Business.dart';
import '../../../utils/CustomTextStyles.dart';
import '../../../utils/StringResource.dart';
import '../../restaurants/RestaurantScreen.dart';
import '../BusinessState.dart';
import 'RestaurantCardWidget.dart';


class BusinessWidget extends StatelessWidget {
  final BusinessLoaded state;
  const BusinessWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(StringResource.restaurant,
              style: CustomTextStyles.heading1),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.businesses.length,
            itemBuilder: (context, index) {
              Businesses business = state.businesses[index];
              return RestaurantCard(
                restaurant: business,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RestaurantScreen(restaurant: business)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
