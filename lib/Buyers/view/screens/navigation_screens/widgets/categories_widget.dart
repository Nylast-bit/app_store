import 'package:appmovil/Buyers/model/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key});
  final Stream<QuerySnapshot> _categoriesStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
            CategoriesModel category = CategoriesModel(
                categoryName: snapshot.data!.docs[index]['categoryName'],
                categoryImage: snapshot.data!.docs[index]['categoryName']
            );
              return Column(
                children: [
                  Image.network(
                      category.categoryImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    category.categoryName,
                  ),

                ],
              );
            },
        );
      },
    );
  }
}
