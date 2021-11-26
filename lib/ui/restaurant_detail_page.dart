import 'package:flutter/material.dart';
import 'package:kotaktemu/common/styles.dart';
import 'package:kotaktemu/data/model/restaurant.dart';
import 'package:kotaktemu/provider/restaurants_provider.dart';
import 'package:kotaktemu/utils/result_state.dart';
import 'package:kotaktemu/widgets/btn_fav.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);
  static const routeName = '/detail_screen';
  static const double imageBorderRadius = 30;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<RestaurantsProvider>(context, listen: false)
            .fetchDetailRestaurant(widget.restaurant.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: BtnFav(restaurant: widget.restaurant),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: _buildDetailPage());
    // body: _buildList());
  }

  Widget _buildDetailPage() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          floating: false,
          pinned: false,
          snap: false,
          elevation: 50,
          flexibleSpace: FlexibleSpaceBar(
              background: Hero(
            tag: widget.restaurant.pictureId,
            child: Image.network(
              'https://restaurant-api.dicoding.dev/images/medium/${widget.restaurant.pictureId}',
              fit: BoxFit.cover,
            ),
          )),
        ),
        Consumer<RestaurantsProvider>(builder: (context, state, _) {
          if (state.restaurantDetailState == ResultState.Loading) {
            return SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  child: Column(
                children: [
                  SizedBox(height: 70),
                  CircularProgressIndicator(
                      color: primaryColor, strokeWidth: 5),
                ],
              ))
            ]));
          } else if (state.restaurantDetailState == ResultState.HasData) {
            final restaurantDetail = state.restaurantDetail;

            return SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurantDetail.name,
                                softWrap: true,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Wrap(children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.yellow,
                                  size: 24,
                                ),
                                Text(
                                  restaurantDetail.rating.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Wrap(children: [
                            Icon(
                              Icons.place,
                              color: hardGreenColor,
                              size: 24,
                            ),
                            Text(
                              restaurantDetail.city,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ]),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Deskripsi",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              restaurantDetail.description,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 5),
                            child: Text(
                              "Category",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ] +
                        restaurantDetail.categories
                            .map((category) => Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        category.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList() +
                        [
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 5),
                            child: Text(
                              "Foods",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ] +
                        restaurantDetail.menus.foods
                            .map(
                              (food) => Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: primaryColor),
                                  child: Center(
                                    child: Text(food.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: whiteColor)),
                                  )),
                            )
                            .toList() +
                        [
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 5),
                            child: Text(
                              "Drinks",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ] +
                        restaurantDetail.menus.drinks
                            .map(
                              (drink) => Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: primaryColor),
                                  child: Center(
                                    child: Text(drink.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: whiteColor)),
                                  )),
                            )
                            .toList() +
                        [
                          Container(
                            margin: EdgeInsets.only(
                                top: 30, bottom: 5, left: 0, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reviews",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ],
                            ),
                          ),
                        ] +
                        restaurantDetail.customerReviews
                            .map((review) => Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Card(
                                    child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(review.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                review.review,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                              ),
                                              Text(
                                                review.date,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                              ),
                                            ],
                                          ),
                                        )))))
                            .toList()),
              ),
            ]));
          } else if (state.restaurantDetailState == ResultState.NoData) {
            return SliverList(
                delegate: SliverChildListDelegate(
                    [Center(child: Text(state.message))]));
          } else if (state.restaurantDetailState == ResultState.Error) {
            if (state.message.contains("SocketException")) {
              return SliverList(
                  delegate: SliverChildListDelegate([
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Icon(Icons.search_off_outlined, size: 100),
                          Text("No Internet",
                              style: Theme.of(context).textTheme.headline2)
                        ],
                      )),
                )
              ]));
            }
            return SliverList(
                delegate: SliverChildListDelegate(
                    [Center(child: Text(state.message))]));
          } else {
            return SliverList(
                delegate: SliverChildListDelegate(
                    [Center(child: Text('Error Not Found'))]));
          }
        }),
      ],
    );
  }
}
