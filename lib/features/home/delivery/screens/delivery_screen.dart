import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zomoto_task/common/constants/colors.dart';
import 'package:zomoto_task/common/widgets/add_filter_widget.dart';
import 'package:zomoto_task/common/widgets/circular_image.dart';
import 'package:zomoto_task/common/widgets/search_bar_widget.dart';
import 'package:zomoto_task/features/home/home/widgets/recipe_item_widget.dart';
import 'package:zomoto_task/common/widgets/restaurant_item_widget.dart';
import 'package:zomoto_task/common/models/pair.dart';
import 'package:zomoto_task/features/home/restaurants_and_dishes/restaurants_and_dishes_screen.dart';
import 'package:zomoto_task/navigation/navigation.dart';

class DeliveryScreen extends ConsumerStatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends ConsumerState<DeliveryScreen> {
  var location = "Tuticorin";
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('location clicked');
                      /*  Navigator.pushNamed(
                          context, ChooseDeliveryLocationScreen.routeName);
                    */
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: primaryColorVariant,
                          size: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: location,
                                        style: textTheme.displaySmall),
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "India",
                                style: textTheme.labelSmall?.copyWith(
                                  color: grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    splashColor: lightGrey,
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.symmetric(vertical: 5)
                          .copyWith(right: 2, left: 1),
                      decoration: const BoxDecoration(
                          color: transparent,
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: midGrey,
                              width: 1,
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        "assets/images/change_language_icon.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.watch(homeNavigation.notifier).state = 1;
                    },
                    child: const CircularImage(
                      imageLink:
                          "https://cdn.pixabay.com/photo/2018/02/08/22/27/flower-3140492_1280.jpg",
                      radius: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverAppBar(
          title: SearchBarWidget(
            leading: Pair(
              Icons.search_rounded,
              () {
                // Navigator.pushNamed(context, SearchScreen.routeName);
              },
            ),
            hint: "Restaurant name or a dish...",
            onClick: () {
              // Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          automaticallyImplyLeading: false,
          backgroundColor: white,
          elevation: 0,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      height: 140,
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage(
                          "assets/images/zomato_offer_icon.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 110,
                      padding: const EdgeInsets.all(15).copyWith(right: 0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.fromBorderSide(
                          BorderSide(
                              color: lightGrey.withOpacity(0.8), width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Offers",
                                style: textTheme.displaySmall,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Up to 60% OFF, Flat Discounts, and other great offers",
                                  style: textTheme.labelMedium?.copyWith(
                                    color: midLightGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Lottie.asset(
                            "assets/lottie/offers_animation.json",
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: lightGrey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "WHAT'S ON YOUR MIND?",
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: grey,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 235,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 15),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                RecipeItemWidget(
                                  recipeName: "Biryani",
                                  recipeImage: "assets/images/biryani_icon.png",
                                  onClick: () {
                                    Navigator.pushNamed(context,
                                        RestaurantsAndDishesScreen.routeName);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RecipeItemWidget(
                                  recipeName: "Fired Rice",
                                  recipeImage: "assets/images/fried_rice.png",
                                  onClick: () {
                                    Navigator.pushNamed(context,
                                        RestaurantsAndDishesScreen.routeName);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: lightGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0)
                              .copyWith(bottom: 10),
                          child: Text(
                            "ALL RESTAURANTS",
                            style: textTheme.bodyLarge?.copyWith(
                              fontSize: 14,
                              color: grey,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(right: 15).copyWith(left: 6),
              scrollDirection: Axis.horizontal,
              children: [
                AddFilterWidget(
                  icon: "assets/images/filter_icon.png",
                  tag: "Sort",
                  hasMultiOption: true,
                  onClick: () {},
                ),
                AddFilterWidget(tag: "Nearest", onClick: () {}),
                AddFilterWidget(tag: "Rating 4.0+", onClick: () {}),
                AddFilterWidget(tag: "Pure Veg", onClick: () {}),
                AddFilterWidget(tag: "New Arrivals", onClick: () {}),
                AddFilterWidget(
                    tag: "Cuisines", hasMultiOption: true, onClick: () {})
              ],
            ),
          ),
          backgroundColor: white,
          elevation: 0,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: Text(
                  "11 restaurants delivering to you",
                  style: textTheme.bodyLarge?.copyWith(
                    color: midLightGrey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: 100000,
          itemBuilder: (context, index) {
            return RestaurantItemWidget(
              imageUrl: Random().nextBool() && Random().nextBool()
                  ? "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg"
                  : Random().nextBool()
                      ? "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000"
                      : Random().nextBool()
                          ? "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg"
                          : "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
              restaurantName: "Anjana Restaurant",
              isFavorite: Random().nextBool(),
              rating: (Random().nextInt(10).toDouble() +
                      (Random().nextDouble() % 5)) %
                  5,
              speciality: Random().nextBool() ? "Biryani" : "Indian",
              foodType: Random().nextBool() ? "North Indian" : "South Indian",
              lowestPriceOfItem: Random().nextInt(5000).toDouble(),
              deliveryTime:
                  Pair(Random().nextInt(50), Random().nextInt(70) + 50),
              distance: Random().nextInt(50000).toDouble(),
              discount:
                  "${Random().nextInt(60)}% OFF up to ${Random().nextInt(100)}",
              onClick: (restaurant) {
                print('detail');
              },
            );
          },
        ),
      ],
    );
  }
}
