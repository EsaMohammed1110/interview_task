import 'package:doodleblue_interview_task/data/Business.dart';
import 'package:doodleblue_interview_task/utils/CustomTextStyles.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Businesses restaurant;
  final GestureTapCallback? onTap;

  const RestaurantCard({Key? key, required this.restaurant, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all( Radius.circular(12)),
              child: Image.network(
                restaurant.imageUrl??"",
                height: 120,
                width: MediaQuery.of(context).size.width*0.32,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        restaurant.name??"",
                        style: CustomTextStyles.heading2,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${restaurant.rating}',
                          style:CustomTextStyles.body3
                        ),
                      const  SizedBox(width: 10),
                        Text(
                          '(${restaurant.reviewCount} reviews)',
                            style:CustomTextStyles.body3
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      restaurant.categories!.map((category) => category.title).join(', '),
                        style:CustomTextStyles.body3.copyWith(color: Colors.black)
                    ),

                       const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red, size: 10),
                            const SizedBox(width: 4),
                            Expanded(
                              child:
                              restaurant.location?.displayAddress!=null?
                              Text(
                                restaurant.location!.displayAddress!.join(', '),
                                style:CustomTextStyles.body3.copyWith(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ) : const SizedBox(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.directions_walk, color: Colors.green, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${restaurant.distance?.toStringAsFixed(2)} meters',
                                style:CustomTextStyles.body3.copyWith(color: Colors.black)
                            ),
                          ],
                        )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
