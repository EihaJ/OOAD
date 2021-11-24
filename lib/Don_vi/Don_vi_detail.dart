import 'package:ooad_project/1.model/Don_Vi_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_project/Don_vi/Don_vi_detail_change.dart';

import '../Chung/navigation.dart';
import '../Chung/drawer.dart';
import '../Chung/bottom_navigation.dart';

import '../database/database.dart';
import 'package:flutter/material.dart';

class DonViDetail extends StatefulWidget {
  final DonViItem donVi;
  DonViDetail({required this.donVi});

  @override
  State<DonViDetail> createState() => _DonViDetailState();
}

class _DonViDetailState extends State<DonViDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navigation(
          tittleText: 'Quản lí Đơn vị',
          backgroundOpacity: 0,
          elevationHeight: 0,
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomNavigation(),
        body: Column(
          children: [
            Image(
              image: AssetImage('assets/DonVi.png'),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 29,
                right: 29,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  widget.donVi.imageUrl != null
                      ? Container(
                          height: 176,
                          width: 176,
                          color: Color(0xffF5F5F5),
                          child: Image(
                            image: NetworkImage(widget.donVi.imageUrl ?? ''),
                          ),
                        )
                      : Container(
                          height: 176,
                          width: 176,
                          color: Color(0xffF5F5F5),
                          child: Image(
                            image: AssetImage('assets/NoImage.png'),
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CustomTextField(
                        width: 123,
                        title: 'Mã Đơn vị',
                        text: widget.donVi.maDV ?? '',
                      ),
                      SizedBox(width: 10),
                      _CustomTextField(
                        width: 219,
                        height: 90,
                        title: 'Tên Đơn Vị',
                        text: widget.donVi.tenDV ?? '',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      _CustomTextField(
                        width: 171,
                        title: 'Số điện thoại',
                        text: widget.donVi.sdt ?? '',
                      ),
                      SizedBox(width: 10),
                      _CustomTextField(
                        width: 171,
                        title: 'Năm thành lập',
                        text: widget.donVi.namThanhLap.toString(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 3,
                      left: 7,
                    ),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTitle('Địa chỉ'),
                        Row(
                          children: [
                            customTitle('Số:'),
                            customText(widget.donVi.diaChi!.soNha ?? ''),
                          ],
                        ),
                        Row(
                          children: [
                            customTitle('Phường:'),
                            customText(widget.donVi.diaChi!.phuong ?? ''),
                          ],
                        ),
                        Row(
                          children: [
                            customTitle('Quận:'),
                            customText(widget.donVi.diaChi!.quan ?? ''),
                          ],
                        ),
                        Row(
                          children: [
                            customTitle('Thành phố/Tỉnh:'),
                            customText(widget.donVi.diaChi!.tp ?? ''),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 171,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent[200],
                            elevation: 0,
                            padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Sửa dữ liệu',
                            style: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DonViDetailChange(donVi: widget.donVi)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 171,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[400],
                            elevation: 0,
                            padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Xoá dữ liệu',
                            style: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            var collection = FirebaseFirestore.instance
                                .collection('donViCollection');
                            collection.doc(widget.donVi.id ?? '').delete();
                            Navigator.popUntil(
                                context, ModalRoute.withName('/'));
                            Navigator.pushNamed(context, '/DonVi');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  double? height;
  final double width;
  final String title;
  final String text;

  _CustomTextField({
    this.height,
    required this.width,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 3,
        left: 7,
      ),
      height: height ?? 45,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTitle(title),
          customText(text),
        ],
      ),
    );
  }
}

Widget customTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontStyle: FontStyle.italic,
      fontSize: 12.8,
    ),
  );
}

Widget customText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );
}
