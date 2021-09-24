import 'package:flutter/material.dart';
import 'package:take_note/note_controller.dart';
import 'package:take_note/colors.dart';
import 'package:take_note/add_note_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';

class NoteListScreen extends StatelessWidget {
  final _noteController = Get.put(NoteController());
  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Get.to(AddNoteScreen());
          _noteController.getNotes();
        },
        backgroundColor: colorPrimaryDark,
        label: Text(
          'Add Note',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Notes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          return ListView.builder(
            itemCount: _noteController.noteModelList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _noteController.noteModelList[index].title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: _randomColor.randomColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          color: Colors.black54,
                          icon: Icon(Icons.delete_outline),
                          onPressed: () => _noteController
                              .deleteNote(_noteController.noteModelList[index]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      _noteController.noteModelList[index].note,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}