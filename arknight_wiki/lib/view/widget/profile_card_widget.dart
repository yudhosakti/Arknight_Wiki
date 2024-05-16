import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            color: Color.fromRGBO(37, 40, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://static.wikia.nocookie.net/mrfz/images/3/33/Go_Ahead_And_Kill_Me.png/revision/latest/scale-to-width-down/1280?cb=20201109142321"),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.56,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Yudho Sakti Rama S.A",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "CC Max Risk Adalah Jalan Ninjaku",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 32,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
