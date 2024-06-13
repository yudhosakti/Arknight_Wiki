import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.002),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(
                            color: const Color.fromARGB(255, 198, 179, 13)),
                        borderRadius: BorderRadius.circular(8)))),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
          ),
        ),
      ],
      backgroundColor: Color.fromRGBO(23, 25, 26, 1),
      appBar: AppBar(
        title: Text(
          "Rating And Reviews",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/rate.png'))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Center(
                            child: Text(
                              "Please Rate This Operator",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Center(
                            child: Text(
                              "Dimas",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.star_rounded,
                                          color: index == 0
                                              ? Colors.amber
                                              : Color.fromRGBO(75, 79, 84, 1),
                                          size: 38,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: TextFormField(
                        style: GoogleFonts.poppins(color: Colors.white),
                        cursorColor: Colors.white,
                        maxLength: 300,
                        textInputAction: TextInputAction.done,
                        maxLines: 7,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(color: Colors.grey),
                            hintText: "Write Your Review",
                            filled: true,
                            fillColor: Color.fromRGBO(89, 94, 97, 1)),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 1,
          )
        ],
      ),
    );
  }
}
