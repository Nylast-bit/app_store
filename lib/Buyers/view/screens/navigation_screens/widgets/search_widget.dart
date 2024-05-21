import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      child: Stack(
        children: [
          Image.asset('assets/icons/searchBanner.jpeg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 48.0,
              top:68.0,
              child: SizedBox(
                width: 250,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                      hintStyle: TextStyle(
                        color: Color(0xff7f7f7f),
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      focusColor: Colors.black,
                      prefixIcon: Image.asset('assets/icons/search.png'),
                      suffixIcon: Image.asset('assets/icons/cam.png'),
                    ),
                  )
              ),
          ),
        ],
      ),
    );
  }
}
