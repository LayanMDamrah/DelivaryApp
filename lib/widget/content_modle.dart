class UnboaedingContent {
  String image;
  String title;
  String description;
  UnboaedingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<UnboaedingContent> contents = [
  UnboaedingContent(
    description: 'Pick your food from our menu\n        More than 35 times',
    image: "assets/images/screen1.png",
    title: 'Select from our\n Best menue ',
  ),
   UnboaedingContent(
    description: 'You can pay cash on delivary and\n          card payment is avilable',
    image: "assets/images/screen2.png",
    title: 'Easy and online payment ',
  ),
    UnboaedingContent(
    description: 'Deliver your food at your\n                     door',
    image: "assets/images/screen3.png",
    title: 'Quick delivary at your doorstep ',
  ),
];
