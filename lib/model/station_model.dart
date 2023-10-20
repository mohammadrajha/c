import 'package:flutter/material.dart';
import 'package:mai_jo/packages/views/all_station/nearby_station.dart';
import 'package:mai_jo/services/constant/path_images.dart';

class DataProvider extends ChangeNotifier {
  List<Shop> _favorites = [];
  List<Shop> _nearbyShops = [
    Shop(
        name: 'Al-Raha station',
        imageUrl: PathImages.imagePlaceHolder2,
        location: 'Abu Nsair - Amman',
        rate: '4.9',
        numberOfUser: '+1000'),
    Shop(
        name: 'Al-Raha station2',
        imageUrl: PathImages.imagePlaceHolder2,
        location: 'Abu Nsair - Amman2',
        rate: '4.0',
        numberOfUser: '+2000'),
    // ... يمكنك إضافة المزيد من المحلات هنا إذا كنت ترغب
  ];

  List<Shop> get favorites => _favorites;
  List<Shop> get nearbyShops => _nearbyShops; // getter جديد للمحلات القريبة

  void addFavorite(Shop shop) {
    _favorites.add(shop);
    notifyListeners();
  }

  void removeFavorite(Shop shop) {
    _favorites.removeWhere((item) => item.name == shop.name);
    notifyListeners();
  }

  bool isFavorite(Shop shop) {
    return _favorites.any((item) => item.name == shop.name);
  }
}
