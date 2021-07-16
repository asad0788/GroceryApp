import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groccery_stores/Models/Category.dart';
import 'package:groccery_stores/widgets/CategoryProduct.dart';

class BuildCatagoryList extends StatelessWidget {
  const BuildCatagoryList({Key? key, required this.categorylist})
      : super(key: key);
  final Category categorylist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoryProduct.routename,
                arguments: {'id': categorylist.id, 'title': categorylist.name});
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: Image.asset(
              categorylist.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          categorylist.name,
          style: GoogleFonts.varelaRound(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
