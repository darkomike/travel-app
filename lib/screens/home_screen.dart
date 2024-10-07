import 'package:flutter/material.dart';
import 'package:travel_app/utils/constant.dart';
import 'package:travel_app/utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentTab = "all";

  _changeCurrrentTab(String tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(homeImage), fit: BoxFit.cover)),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 60,
                          width: d.getPhoneScreenWidth(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.category,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.notifications,
                                          color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        )),
                    Positioned(bottom: 10, child: _buildMessageComponent()),
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                width: d.getPhoneScreenWidth(),
                padding: const EdgeInsets.only(top: 10, left: 15, bottom: 90),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: null, child:  Text(
                          "Deals".toUpperCase(),
                          style:
                              const TextStyle(fontSize: 18,color: Colors.black,  fontWeight: FontWeight.bold),
                        ),),
                        TextButton(onPressed: (){}, child:  Text(
                          "See all".toUpperCase(),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        _buildDealsTab(tab: "All"),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildDealsTab(tab: "Flights"),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildDealsTab(tab: "Hotels"),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildDealsTab(tab: "Transpotations"),
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        key: const PageStorageKey<String>('all'),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            constraints: const BoxConstraints(
                                maxHeight: 120, minHeight: 120),
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            width: d.getPhoneScreenWidth() * (3 / 4),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(homeImage),
                                    fit: BoxFit.cover),
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(25)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _buildMessageComponent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: d.getPhoneScreenWidth(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: d.getPhoneScreenWidth(),
            child: const Text(
              "What is your\nnext destination?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconComponent(icon: Icons.flight),
              _buildIconComponent(icon: Icons.hotel),
              _buildIconComponent(icon: Icons.local_taxi),
              _buildIconComponent(icon: Icons.car_rental_sharp),
            ],
          ),
        ],
      ),
    );
  }

  _buildIconComponent({required IconData icon}) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.5)),
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _buildDealsTab({required String tab}) {
    return GestureDetector(
      onTap: () {
        _changeCurrrentTab(tab.toLowerCase());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tab),
          Flexible(
            child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: _currentTab == tab.toLowerCase() ? Colors.red : null,
                ),
                height: 5,
                duration: const Duration(milliseconds: 100),
                child: Text(
                  tab,
                  style: const TextStyle(color: Colors.red),
                )),
          )
        ],
      ),
    );
  }
}
