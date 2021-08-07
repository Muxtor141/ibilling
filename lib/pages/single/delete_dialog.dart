import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/services/events_cubit.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitData = DataProvider();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = sizeQuery.height -
        cubitData.state -
        MediaQuery.of(context).viewInsets.top;
    return AlertDialog(
      actions: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.037,
              ),
              Expanded(
                child: Container(
                  // width: sizeQuery.width * 0.3,
                  // height: heightQuery * 0.049,
                  child: MaterialButton(
                    elevation: 0,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Color(0x26FF426D),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xFFFF426D)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizeQuery.width * 0.032,
              ),
              Expanded(
                child: Container(
                  // width: sizeQuery.width * 0.3,
                  // height: heightQuery * 0.049,
                  child: MaterialButton(
                    elevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Color(0xFFFF426D),
                    child: Text(
                      'Done',
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xFFFDFDFD)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizeQuery.width * 0.037,
              ),
            ],
          ),
        )
      ],
      backgroundColor: Theme.of(context).cardColor,
      content: Container(
        width: sizeQuery.width * 0.91,
        child: TextField(
          cursorColor: Colors.white,
          minLines: 1,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFFF1F1F1)),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5C5C5C)),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5C5C5C)),
                borderRadius: BorderRadius.circular(4),
              ),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5C5C5C)),
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: Color(0xFF5C5C5C)),
        ),
      ),
      title: Center(
        child: Text(
          'Leave a comment,why are you \n       deleting this contract',
          style: GoogleFonts.ubuntu(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFF1F1F1)),
        ),
      ),
    );
  }
}
