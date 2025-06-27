import 'package:flutter/material.dart';
import 'package:food_dilivary_app/widget/widget_support.dart';

class Details extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final String price;

  const Details({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int counter = 1;
  late double unitPrice;

  @override
  void initState() {
    super.initState();
    unitPrice = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = unitPrice * counter;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
            Image.asset(
              widget.imagePath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                    Text(
                      widget.subtitle,
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (counter > 1) {
                      setState(() {
                        counter--;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  counter.toString(),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.description,
              style: AppWidget.LightTextFeildStyle(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Delivery Time ',
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                SizedBox(width: 30),
                Icon(Icons.alarm_outlined, color: Colors.black45),
                Text(' 30 min', style: AppWidget.semiBoldTextFeildStyle()),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: AppWidget.HandleTextFeildStyle(),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      ],
                    ),
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
