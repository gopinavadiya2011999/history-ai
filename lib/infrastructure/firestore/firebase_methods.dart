import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';

class FirebaseMethods {
  static Future<void> writeData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create example data
    List<User> users = [
      User(
        name: "Ludwig van Beethoven",
        photo: "dffffff",
        userDesc: "description o duf dfhd dfb dfhd fdf d dfb dfd df",
      ),User(
        name: "Wolfgang Amadeus Mozart",
        photo: "dffffff",
        userDesc: "description o duf dfhd dfb dfhd fdf d dfb dfd df",
      ),

    ];


    List<User> users2 = [
      User(
        name: "Johann Sebastian Bach",
        photo: "rrrr",
        userDesc: "description o duf dfhd dfb dfhd fdf d dfb dfd df",
      ),User(
        name: "Jimi Hendrix",
        photo: "rrrr",
        userDesc: "description o duf dfhd dfb dfhd fdf d dfb dfd df",
      ),

    ];
    Category category = Category(id: "98-Arts and Literature", name: "Arts and Literature", subCategory: [
      SubCategory(id: 'id-Composer', name: "Composer", users: users),
      SubCategory(id: 'id-Musician', name: "Musician", users: users2),

    ]);

    try {
      await firestore.collection("categories").doc().set(
        category.toMap()
      );
      print("Data written successfully!");
    } catch (e) {
      print("Error writing data: $e");
    }
  }

  static Future<List<Category>?> fetchAllCategories() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Initialize an empty list to store categories
      List<Category> categories = [];

      // Fetch all documents from the "categories" collection
      QuerySnapshot querySnapshot = await firestore.collection("categories").get();

      // Iterate through each document in the collection
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Parse each document into a Category object and add it to the list
        categories.add(Category.fromMap(data));
      }

      return categories;
    } catch (e) {
      print("Error fetching all categories: $e");
      return null;
    }
  }

}
