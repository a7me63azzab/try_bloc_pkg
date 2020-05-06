// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    bool message;
    String err;
    Data data;

    HomeModel({
        this.message,
        this.err,
        this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<Slider> topsliders;
    List<Maincategory> maincategories;
    List<Slider> bottomslider;
    List<Lastitem> lastitems;

    Data({
        this.topsliders,
        this.maincategories,
        this.bottomslider,
        this.lastitems,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        topsliders: List<Slider>.from(json["topsliders"].map((x) => Slider.fromJson(x))),
        maincategories: List<Maincategory>.from(json["maincategories"].map((x) => Maincategory.fromJson(x))),
        bottomslider: List<Slider>.from(json["bottomslider"].map((x) => Slider.fromJson(x))),
        lastitems: List<Lastitem>.from(json["lastitems"].map((x) => Lastitem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "topsliders": List<dynamic>.from(topsliders.map((x) => x.toJson())),
        "maincategories": List<dynamic>.from(maincategories.map((x) => x.toJson())),
        "bottomslider": List<dynamic>.from(bottomslider.map((x) => x.toJson())),
        "lastitems": List<dynamic>.from(lastitems.map((x) => x.toJson())),
    };
}

class Slider {
    int id;
    String image;
    String title;
    String url;

    Slider({
        this.id,
        this.image,
        this.title,
        this.url,
    });

    factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "url": url,
    };
}



class Lastitem {
    int id;
    Image image;
    String title;
    int offer;
    int discountprice;
    int rate;
    int favorited;

    Lastitem({
        this.id,
        this.image,
        this.title,
        this.offer,
        this.discountprice,
        this.rate,
        this.favorited,
    });

    factory Lastitem.fromJson(Map<String, dynamic> json) => Lastitem(
        id: json["id"],
        image: Image.fromJson(json["image"]),
        title: json["title"],
        offer: json["offer"],
        discountprice: json["discountprice"],
        rate: json["rate"],
        favorited: json["favorited"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image.toJson(),
        "title": title,
        "offer": offer,
        "discountprice": discountprice,
        "rate": rate,
        "favorited": favorited,
    };
}

class Image {
    int id;
    int itemId;
    String image;

    Image({
        this.id,
        this.itemId,
        this.image,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        itemId: json["item_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "image": image,
    };
}

class Maincategory {
    int id;
    String name;
    String image;

    Maincategory({
        this.id,
        this.name,
        this.image,
    });

    factory Maincategory.fromJson(Map<String, dynamic> json) => Maincategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
