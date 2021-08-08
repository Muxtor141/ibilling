import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/services/events_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/services/fetching/list_event.dart';
import 'package:ibilling/services/fetching/networking_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class DeleteDialog extends StatelessWidget {
  final PageController controller;
  final BuildContext context3;
  final int contractIndex;
  const DeleteDialog(
      {Key? key,
      required this.contractIndex,
      required this.controller,
      required this.context3})
      : super(key: key);

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
                    'contractItem.cancel'.tr(),
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
                    context3
                        .read<FetchDataBloc2>()
                        .add(DeleteContract(contractIndex));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("contractItem.removed".tr()),
                        duration: Duration(milliseconds: 1000),
                      ),
                    );
                    Navigator.pop(context);

                    Timer(Duration(seconds: 1), () {
                      controller.jumpTo(0);
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Color(0xFFFF426D),
                  child: Text(
                    'contractItem.done'.tr(),
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
        ))
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
