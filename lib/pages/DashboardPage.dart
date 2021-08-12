import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starwars/bloc/PeopleBloc.dart';
import 'package:starwars/client/PeopleClient.dart';
import 'package:starwars/event/PeopleEvent.dart';
import 'package:starwars/repository/PeopleRepository.dart';
import 'package:starwars/state/PeopleState.dart';
import 'package:starwars/utils/SizeUtil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: SizeUtil.screenWidth,
          height: SizeUtil.screenHeight,
          child: BlocProvider(
            create: (context) => PeopleBloc(
                repository: PeopleRepository(peopleClient: PeopleClient())),
            child: BlocBuilder<PeopleBloc, PeopleState>(
              builder: (context, state) {
                if (state is PeopleEmpty) {
                  BlocProvider.of<PeopleBloc>(context).add(GetPeopleData());
                }
                if (state is PeopleError) {
                  return Center(
                    child: Text('failed to fetch people'),
                  );
                }
                if (state is PeopleLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.people.length,
                      itemBuilder: (context, index) {
                        var people = state.people[index];
                        return Container(
                          width: SizeUtil.screenWidth,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    people.name!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.star,
                                        size: 16,
                                      ),
                                      onPressed: () {})
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Height :"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Mass :"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Hair Color :"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Skin Color :"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Eye Color :"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Gender :"),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(people.height!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(people.mass!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(people.hairColor!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(people.skinColor!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(people.eyeColor!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(people.gender!),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.edit,
                                        size: 16,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.trash,
                                          size: 16),
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
