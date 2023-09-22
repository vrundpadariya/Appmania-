import 'package:app_mania/utils/global.dart';
import 'package:flutter/material.dart';

class appmania extends StatefulWidget {
  const appmania({super.key});

  @override
  State<appmania> createState() => _appmaniaState();
}

class _appmaniaState extends State<appmania> {
  int? dropDownValue;
  bool favfoods = false;
  bool cart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Surat City',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('fav');
            },
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Find Tha",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Best",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Food ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Around you",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropdownButton(
                    value: dropDownValue,
                    hint: Text("Select catagory..."),
                    items: Global.allfoods.map((e) {
                      return DropdownMenuItem(
                        value: Global.allfoods.indexOf(e),
                        child: Text("${e['categoryName']}"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        dropDownValue = val!;
                      });
                    },
                  ),
                  Visibility(
                    visible: (dropDownValue != null) ? true : false,
                    child: ActionChip(
                      elevation: 0,
                      label: const Row(
                        children: [
                          Icon(
                            Icons.clear,
                            size: 15,
                          ),
                          Text("clear"),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          dropDownValue = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              const Row(
                children: [
                  Text(
                    "Find",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5km",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: Global.allfoods.map((e) {
                  return SizedBox(
                    height: 410,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.all(8),
                                height: 50,
                                child: Text(
                                  "${e['categoryName']}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ...e['categoryProducts'].map(
                                      (e) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigator.of(context).pushNamed(
                                                'details',
                                                arguments: e,
                                              );
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              left: 5,
                                              right: 25,
                                              bottom: 50,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF4F4F4),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            width: 200,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                      right: 10,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          e['faveProduct'] =
                                                              !e['faveProduct'];
                                                        });
                                                        (e['faveProduct'] ==
                                                                true)
                                                            ? cartfoods.add(e)
                                                            : cartfoods
                                                                .remove(e);
                                                      },
                                                      icon: (e['faveProduct'] ==
                                                              false)
                                                          ? const Icon(
                                                              Icons
                                                                  .favorite_outline_rounded,
                                                              color: Colors
                                                                  .blueAccent,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .favorite_outlined,
                                                              color: Colors
                                                                  .blueAccent,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 50,
                                                    width: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Color(0xFFF4F4F4),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 15,
                                                                ),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFFF4F4F4),
                                                                  radius: 80,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "${e['thumbnail']}"),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 10,
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "${e['name']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Text(
                                                                          "${e['time']}",
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.star_border,
                                                                              color: Colors.amber,
                                                                            ),
                                                                            Text("${e['ratting']}")
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "PR.${e['price']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
