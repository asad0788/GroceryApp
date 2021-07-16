import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groccery_stores/Models/Category.dart';

import 'package:groccery_stores/widgets/BuildCatagoryList.dart';

class BuildCatagory extends StatelessWidget {
  const BuildCatagory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Categories',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffE0E6EE),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Text(
                      'Explore All',
                      style: GoogleFonts.varelaRound(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => BuildCatagoryList(
                categorylist: Category.categoryList[index],
              ),
              itemCount: Category.categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
