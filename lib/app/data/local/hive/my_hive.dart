import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:repo_star/app/modules/repo-star/model/repo_model.dart';

class MyHive {
  // Prevent making an instance of this class
  MyHive._();

  // Hive box to store item data

  static late Box<Items> _itemsBox;

  // Box name, it's like the table name

  static const String _itemsBoxName = 'items';

  /// Initialize local db (HIVE)
  /// Pass testPath only if you are testing hive
  static Future<void> init(
      {Function(HiveInterface)? registerAdapters, String? testPath}) async {
    if (testPath != null) {
      Hive.init(testPath);
    } else {
      await Hive.initFlutter();
    }
    await registerAdapters?.call(Hive);

    await initItemsBox();
  }

  /// Initialize item box

  static Future<void> initItemsBox() async {
    _itemsBox = await Hive.openBox<Items>(_itemsBoxName);
  }

  /// Save all items to the database

  static Future<void> saveAllItems(List<Items> items) async {
    try {
      await _itemsBox.clear();
      await _itemsBox.addAll(items);
    } catch (error) {
      Logger().e("$error");
    }
  }

  /// Get all items from Hive

  static List<Items> getAllItems() {
    final items = _itemsBox.values.toList();
    return items.cast<Items>();
  }
}
