import 'package:flutter/material.dart';
import 'package:body_mass_calculator/constants/app_constants.dart';
import 'package:body_mass_calculator/widgets/left_bar.dart';
import 'package:body_mass_calculator/widgets/right_bar.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
 final TextEditingController _heightController = TextEditingController();
 final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Body_Mass Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // no shadow effecr
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
         height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w / (_h * _h);
                if (_bmiResult > 25) {
                  _textResult = "You\'re over weight";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You have normal weight";
                } else {
                  _textResult = "You\'re under weight";
                }
              });
            },
            child: Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: accentHexColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor),
              ),
            ),
          ),
          LeftBar(barWidth: 40),
          SizedBox(height: 20),
          LeftBar(barWidth: 70),
          SizedBox(height: 20),
          LeftBar(barWidth: 40),
          SizedBox(height: 20),
          RightBar(barwidth: 50),
          SizedBox(height: 40),
          RightBar(barwidth: 50),
        ],
      )),
    );
  }
}
