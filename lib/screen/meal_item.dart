import "package:flutter/material.dart";
import "package:meal_app/models/meal.dart";
import "package:meal_app/screen/meal_detail_screen.dart";

class MealItem extends StatelessWidget {
  const MealItem({
  required this.id,
    required this.ImageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
final String id;
  final String ImageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

   void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.id, arguments: id);
  }
  // value is the return value from pop
  String get ComplexityText{
    switch(complexity){
      case Complexity.Simple:return "Simple";break;
      case Complexity.Hard:return "Hard";break;
      case Complexity.Challenging:return "Challenging";break;
      default :return "UnKnown";break;


    }
  }
  String get AffordabilityText{
    switch(affordability){
      case Affordability.Affordable:return "Affordable";break;
      case Affordability.Luxurious:return "Luxurious";break;
      case Affordability.Pricey:return "Pricey";break;
      default :return "UnKnown";break;


    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    ImageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [Icon(Icons.schedule), SizedBox(width: 6,), Text("$duration  min")],
                  ),
                  Row(
                    children: [Icon(Icons.work),  SizedBox(width: 6,),Text("$ComplexityText  ")],
                  ),
                  Row(
                    children: [Icon(Icons.attach_money), Text("$AffordabilityText")],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//ClipRRecthelp to make a  قص و عمل حواف مدورة
