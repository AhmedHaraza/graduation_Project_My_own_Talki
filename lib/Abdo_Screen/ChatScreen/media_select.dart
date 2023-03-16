import 'package:flutter/material.dart';

Widget mediaSelection(screenwidth) {
  return Container(
    margin: const EdgeInsets.only(bottom: 60),
    child: SimpleDialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: const Color(0xff161616),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.bottomCenter,
      contentPadding: const EdgeInsets.fromLTRB(5, 40, 5, 40),
      children: [
        ConstrainedBox(constraints: BoxConstraints(minWidth: screenwidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.upload_file,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
              
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                iconSize: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.audio_file,
                  color: Colors.white,
                ),
                iconSize: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.contacts,
                  color: Colors.white,
                ),
                iconSize: 30,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
