import 'package:doodleblue_interview_task/data/Business.dart';
import 'package:doodleblue_interview_task/screen/buisness/widget/RestaurantCardWidget.dart';
import 'package:doodleblue_interview_task/utils/CustomTextStyles.dart';
import 'package:doodleblue_interview_task/utils/StringResource.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final Businesses restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(
                            20.0)), // Adjust the value as needed
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                      RestaurantCard(restaurant: widget.restaurant),
                    ],
                  )),
              const SizedBox(height: 8.0),
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                // Adjust the value as needed
                elevation: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),

                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8.0), // Adjust the value as needed
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                    child: Text(StringResource.searchForDishes,
                                        style: CustomTextStyles.body2
                                            .copyWith(color: Colors.black))),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.mic,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(StringResource.menu, style: CustomTextStyles.heading2),
                        ),
                        const SizedBox(height: 200,
                        child: Center(child: Text(StringResource.noItemFound,style: CustomTextStyles.body2,),),)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0)
            ],
          ),
        ),
      ),
    );
  }
}
