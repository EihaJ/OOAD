import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff6691FF).withOpacity(0.7),
              Color(0xff8396FB),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 135,
              width: double.infinity,
              //color: Colors.black,
              alignment: Alignment(-0.8, 0.9),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 64,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/DonVi');
              },
              textButton: 'Quản lí Đơn vị',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/ChucVu');
              },
              textButton: 'Quản lí Chức vụ',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/DoanThe');
              },
              textButton: 'Quản lí Đoàn thể',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/TrinhDo');
              },
              textButton: 'Quản lí Trình Độ',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/ThanNhan');
              },
              textButton: 'Quản lí Thân Nhân',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/NhanVien');
              },
              textButton: 'Quản lí Nhân viên',
            ),
            ButtonDrawer(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/Luong');
              },
              textButton: 'Quản lí Lương',
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDrawer extends StatelessWidget {
  ButtonDrawer({
    @required this.onPressed,
    @required this.textButton,
  });

  final onPressed, textButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Container(
            width: double.infinity,
            //color: Colors.black,
            alignment: Alignment(-0.9, 0),
            child: Text(
              textButton,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 31.25,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          onPressed: onPressed,
        ),
        SizedBox(height: 6),
      ],
    );
  }
}
