import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeBloc.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeEvents.dart';
import 'package:flutterblocpkg/src/Screens/Home/homeStates.dart';
import 'package:flutterblocpkg/src/Utils/colors.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // BlocProvider.of<HomeBloc>(context).add(HomePageStarted());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<HomeBloc>(context).add(HomePageStarted());
    super.didChangeDependencies();
  }

  Column _buildCategoryItem({String categoryName, String categoryImage}) {
    return Column(
      children: <Widget>[
        Container(
          width: 140,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(categoryImage == null
                  ? "https://cdn.pixabay.com/photo/2016/12/19/21/36/winters-1919143_1280.jpg"
                  : "https://five-starsupplies.com/users/images/$categoryImage"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            // color: Colors.grey.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: AutoSizeText(
              categoryName ?? "",
              maxLines: 2,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop(BuildContext context) {
    return showCupertinoDialog(
          context: context,
          builder: (context) => new CupertinoAlertDialog(
            title: new Text('هل انت متاكد ؟'),
            content: new Text('هل تريد اغلاق التطبيق ؟'),
            actions: <Widget>[
              new CupertinoButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('لا')),
              new CupertinoButton(
                onPressed: () => exit(0),
                child: new Text('نعم'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor:
              Color(getColorHexFromStr("#F3FDFF")).withOpacity(0.96),
          appBar: AppBar(
            elevation: 0.0,
            actions: <Widget>[
              // Badge(
              //   badgeContent: Text(
              //     "$itemsNum",
              //     style: TextStyle(fontSize: 10, color: Colors.white),
              //   ),
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.of(context)
              //           .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
              //         return CartPage();
              //       })).then((_) {
              //         _getHomeData();
              //         _openDataBase();
              //       });
              //     },
              //     icon: Image.asset(
              //       "assets/icons/cart.png",
              //       width: 25,
              //       height: 25,
              //     ),
              //   ),
              // ),
              IconButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
                  //   return SearchPage();
                  // })).then((_) {
                  //   _getHomeData();
                  //   _openDataBase();
                  // });
                },
                icon: Image.asset(
                  "assets/icons/search.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                // Navigator.of(_scaffoldKey.currentContext)
                //     .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
                //   return MenuPage();
                // })).then((_) {
                //   _getHomeData();
                //   _openDataBase();
                // });
              },
              icon: Image.asset(
                "assets/icons/menu.png",
                width: 25,
                height: 25,
              ),
            ),
            title: Text("الرئيسيه"),
          ),
          body: SingleChildScrollView(
            child: BlocListener<HomeBloc, HomeStates>(
              listener: (context, state) {
                // if (state is HomePageStartedState) {
                //   return Center(
                //     child: CupertinoActivityIndicator(
                //       animating: true,
                //       radius: 15,
                //     ),
                //   );
                // } else if (state is HomePageCompletedState) {
                //   print("=-=-= ${state.homeModel.toJson().toString()}");
                //   return Container();
                // } else {
                //   return Center(child: Text("empty"));
                // }

                // else if (state is HomePageCompletedState) {
                //   return null;
                // } else {
                //   return null;
                // }
              },
              child: BlocBuilder<HomeBloc, HomeStates>(
                builder: (context, state) {
                  if (state is HomePageStartedState)
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: CupertinoActivityIndicator(
                          animating: true,
                          radius: 15,
                        ),
                      ),
                    );
                  else if (state is HomePageFinishedState)
                    return Center(child: Text("empty"));
                  else
                    // print("=-=-= ${state.homeModel.toJson().toString()}");
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 150,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Swiper(
                            autoplay: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    // "https://five-starsupplies.com/users/images/${homeModel.homeData.topsliders[index].image}",
                                    "https://cdn.pixabay.com/photo/2016/12/19/21/36/winters-1919143_1280.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                            itemCount: 3,
                            scale: 0.9,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "الاقسام",
                              style: TextStyle(
                                color: Color(
                                  getColorHexFromStr("#B81807"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).push(
                                //     PageRouteBuilder(pageBuilder: (_, __, ___) {
                                //   return AllCategoriesView();
                                // })).then((_) {
                                //   _getHomeData();
                                //   _openDataBase();
                                // });
                              },
                              child: Text(
                                "الكل",
                                style: TextStyle(
                                  color: Color(
                                    getColorHexFromStr("#B81807"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(PageRouteBuilder(
                                    //     pageBuilder: (_, __, ___) {
                                    //   return AllProductsView(
                                    //     categoryId: homeModel
                                    //         .homeData.maincategories[index].id,
                                    //     categoryName: homeModel
                                    //         .homeData.maincategories[index].name,
                                    //   );
                                    // })).then((_) {
                                    //   _getHomeData();
                                    //   _openDataBase();
                                    // });
                                  },
                                  child: _buildCategoryItem(
                                      categoryName: "wqweq",
                                      categoryImage: null),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                // "https://five-starsupplies.com/users/images/${homeModel.homeData.bottomslider[0].image}",
                                "https://cdn.pixabay.com/photo/2016/12/19/21/36/winters-1919143_1280.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // Swiper(
                          //   autoplay: false,

                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 4),
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(10),
                          //         child: Image.network(
                          //           "https://five-starsupplies.com/users/images/${homeModel.homeData.bottomslider[index].image}",
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   itemCount: homeModel.homeData.bottomslider.length,
                          //   scale: 0.9,
                          // ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "المنتجات",
                              style: TextStyle(
                                color: Color(
                                  getColorHexFromStr("#B81807"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).push(
                                //     PageRouteBuilder(pageBuilder: (_, __, ___) {
                                //   return AllProductsView();
                                // })).then((_) {
                                //   _getHomeData();
                                //   _openDataBase();
                                // });
                              },
                              child: Text(
                                "كل المنتجات",
                                style: TextStyle(
                                  color: Color(
                                    getColorHexFromStr("#B81807"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        // Container(
                        //   height: 200,
                        //   // color: Colors.red,
                        //   width: double.infinity,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 3,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: InkWell(
                        //             onTap: () {
                        //               // Navigator.of(context).push(PageRouteBuilder(
                        //               //     pageBuilder: (_, __, ___) {
                        //               //   return ProductDetailview(
                        //               //     itemId: homeModel
                        //               //         .homeData.lastitems[index].id,
                        //               //   );
                        //               // })).then((_) {
                        //               //   _getHomeData();
                        //               //   _openDataBase();
                        //               // });
                        //             },
                        //             child: ProductWidget(
                        //               lastItem:
                        //                   homeModel.homeData.lastitems[index],
                        //             )),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
