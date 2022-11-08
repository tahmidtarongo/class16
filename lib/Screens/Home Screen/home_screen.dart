import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:travel_academy/Constant%20Data/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> placeName = ['Bangladesh', 'India', 'Pakistan', 'Nepal', 'Japan', 'China'];
  List<int> favouriteIndex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            color: secondaryColor,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hei, Jhon Willy',
                              style: TextStyle(color: subtitleColor),
                            ),
                            Text(
                              'Discover Your Destination For Holiday',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0, overflow: TextOverflow.ellipsis),
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 80,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.white, width: 6.0),
                                image: const DecorationImage(
                                  image: NetworkImage('https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/45.png'),
                                  fit: BoxFit.fill,
                                )),
                          ))
                    ],
                  ),
                  const Spacer(),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Search Location...',
                      hintStyle: const TextStyle(color: subtitleColor),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0)),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        IconlyLight.search,
                        color: mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(color: titleColor, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                HorizontalList(
                    padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
                    spacing: 20.0,
                    itemCount: placeName.length,
                    itemBuilder: (_, i) {
                      return Material(
                        elevation: 2.0,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: const DecorationImage(
                                        image: NetworkImage('https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/45.png'))),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                placeName[i],
                                style: const TextStyle(color: titleColor, fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, i) {
                        return Container(
                          width: MediaQuery.of(context).size.width/2.2,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height / 4.2,
                                    width: MediaQuery.of(context).size.width/2.2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://img.freepik.com/free-photo/asian-woman-wearing-japanese-traditional-kimono-yasaka-pagoda-sannen-zaka-street-kyoto-japan_335224-40.jpg'),fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(14.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.white
                                          ),
                                          child: Icon(favouriteIndex.contains(i) ? Icons.favorite : Icons.favorite_border,color: mainColor,),
                                        ).onTap((){
                                          setState(() {
                                           favouriteIndex.contains(i) ? favouriteIndex.remove(i) : favouriteIndex.add(i);
                                          });
                                        }),
                                        Container(
                                          padding: EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC0C7FF).withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(14.0)
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(IconlyBold.star,color: Colors.white,),
                                              SizedBox(width: 6.0,),
                                              Text('4.6',style: TextStyle(color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0,),
                              Text('Fujinomia',style: TextStyle(color: titleColor,fontWeight: FontWeight.bold,fontSize: 18.0),),
                              SizedBox(height: 4.0,),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0,bottom: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Japan',style: TextStyle(color: subtitleColor),),
                                    Row(
                                      children: [
                                        Text('\$300',style: TextStyle(color: subtitleColor,decoration: TextDecoration.lineThrough),),
                                        SizedBox(width: 2.0,),
                                        Text('\$250',style: TextStyle(color: mainColor,fontSize: 18.0,fontWeight: FontWeight.bold,),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
