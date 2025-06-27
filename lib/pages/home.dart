// ✅ home.dart
import 'package:flutter/material.dart';
import 'package:food_dilivary_app/pages/details.dart';
import 'package:food_dilivary_app/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello Layan ,', style: AppWidget.boldTextFeildStyle()),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text('Delicious Food', style: AppWidget.HandleTextFeildStyle()),
              Text(
                'Discover and Get Great Food',
                style: AppWidget.LightTextFeildStyle(),
              ),
              SizedBox(height: 15),
              Container(margin: EdgeInsets.only(right: 10), child: showItem()),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    foodItem(
                      image: 'assets/images/salad2.png',
                      title: 'Veggie Taco Salad',
                      subtitle: 'Fresh and Healthy',
                      price: '\$25',
                      description:
                          'A fresh and healthy chickpea salad made with tender chickpeas, crisp cucumbers, juicy tomatoes, red onions, and fresh parsley. Tossed with a zesty lemon-olive oil dressing and a pinch of salt and pepper for a delicious Mediterranean flavor.',
                    ),
                    SizedBox(width: 20),
                    foodItem(
                      image: 'assets/images/salad3.png',
                      title: 'Mix Veggie',
                      subtitle: 'Fresh and Healthy',
                      price: '\$28',
                      description:
                          'A colorful salad mix of seasonal vegetables tossed with herbs and a tangy vinaigrette.',
                    ),
                    SizedBox(width: 20),
                    foodItem(
                      image: 'assets/images/salad5.png',
                      title: 'Veggie Taco',
                      subtitle: 'Fresh and Healthy',
                      price: '\$26',
                      description:
                          'Crispy taco shells filled with fresh greens, beans, and a light dressing.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        imagePath: 'assets/images/salad4.png',
                        title: 'Mediterranean Chicken Salad',
                        subtitle: 'with Salad & Dressing',
                        description:
                            'A hearty and flavorful salad with grilled chicken, Mediterranean spices, and a creamy dressing. Served fresh with seasonal greens.',
                        price: '\$30',
                      ),
                    ),
                  );
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/salad4.png',
                          height: 160,
                          width: 160,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Text(
                                'Mediterranean Chicken Salad',
                                style: AppWidget.semiBoldTextFeildStyle(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Text(
                                'salad, chicken, dressing',
                                style: AppWidget.LightTextFeildStyle(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '\$30',
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget foodItem({
    required String image,
    required String title,
    required String subtitle,
    required String price,
    required String description,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                imagePath: image,
                title: title,
                subtitle: subtitle,
                description: description,
                price: price,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
              Text(title, style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 6),
              Text(subtitle, style: AppWidget.LightTextFeildStyle()),
              Text(price, style: AppWidget.semiBoldTextFeildStyle()),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        categoryIcon('ice-cream.png', icecream, () {
          setState(() {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
          });
        }),
        categoryIcon('pizza.png', pizza, () {
          setState(() {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
          });
        }),
        categoryIcon('salad.png', salad, () {
          setState(() {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
          });
        }),
        categoryIcon('burger.png', burger, () {
          setState(() {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
          });
        }),
      ],
    );
  }

  Widget categoryIcon(String img, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(6),
          child: Image.asset(
            'assets/images/$img',
            height: 50,
            width: 50,
            color: selected ? Colors.white : Colors.black,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}