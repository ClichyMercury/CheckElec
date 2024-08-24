import 'package:check_elec/models/equipementModel.dart';
import 'package:check_elec/screens/pages/settings.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';
import 'dart:io' show Platform;

class MyMyProlile extends StatefulWidget {
  const MyMyProlile({
    super.key,
  });

  @override
  State<MyMyProlile> createState() => _MyMyProlileState();
}

class _MyMyProlileState extends State<MyMyProlile> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> averageUseTime = [
    'Moins de 2O min',
    '30 min',
    '1 heure',
    '2 heures',
    '5 heures',
    '8 heures',
    '15 heures',
    '24 heures'
  ];
  final List<Equipment> equipmentList =
      []; /* List.generate(
    10,
    (index) => Equipment(
      name: 'Équipement ${index + 1}',
      quantity:
          '${(index + 1) * 2}', // Quantité de l'équipement, juste pour l'exemple
    ),
  ); */

  void _addItem(Equipment newEquipment) {
    final int newIndex = equipmentList.length;
    equipmentList.add(newEquipment);
    _listKey.currentState!.insertItem(newIndex);
  }

  void _removeItem(int index) {
    final removedItem = equipmentList.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation, index),
    );
  }

  void _showAddEquipmentModal(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController powerController = TextEditingController();

    String selectedQuantity = '1';
    String selectedAverageUseTime = 'Moins de 2O min';

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 4,
                shadowColor: CustumTheme.orangeMainColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Entrer le nom de l\'équipement'),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Nombre d\'appareils:'),
                      Card(
                        elevation: 4,
                        shadowColor: CustumTheme.orangeMainColor,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedQuantity,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedQuantity = newValue!;
                                });
                              },
                              items: <String>[
                                '1',
                                '2',
                                '3',
                                '4',
                                '5'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shadowColor: CustumTheme.orangeMainColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: powerController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Entrer la puissance',
                              hintText: 'En Watt'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Temps moyen d\'utilisation'),
                    ],
                  ),
                  Card(
                    elevation: 4,
                    shadowColor: CustumTheme.orangeMainColor,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedAverageUseTime,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAverageUseTime = newValue!;
                            });
                          },
                          items: averageUseTime
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      CustumTheme.orangeMainColor, // Couleur de fond du bouton
                ),
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    _addItem(Equipment(
                        name: nameController.text,
                        quantity: selectedQuantity,
                        power: powerController.text));
                    Navigator.pop(context);
                  } else {
                    if (Platform.isIOS) {
                      iosShowAlertDialog(context,
                          title: "Verifiez les champs",
                          content: 'Veuillez entrer un nom pour l\'équipement',
                          defaultActionText: "OK");
                    } else {
                      showAlertDialog(context,
                          title: "Verifiez les champs",
                          content: 'Veuillez entrer un nom pour l\'équipement',
                          defaultActionText: "OK");
                    }
                  }
                },
                child: Text(
                  'Ajouter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF3F2F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Settings()));
          },
          splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset("assets/icons/settings.png"),
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.orange.withOpacity(0.2),
            child: const Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "Mon Profil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: height / 13,
                    backgroundColor: CustumTheme.orangeMainColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: height / 4.7,
                    width: width / 1.8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GAEL SASSAN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 18,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            '+225 07 68 70 73 74',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'gaelelscientifico@gmail.com',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'II Plateaux',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Container(
                            width: 146,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: CustumTheme.textColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Center(
                                child: Text(
                              'inscrit depuis le 23/06/2023',
                              style: TextStyle(
                                color: CustumTheme.bgColor,
                                fontSize: 9,
                                fontWeight: FontWeight.w100,
                              ),
                            )),
                          )
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: width,
                height: 350,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Informations sur l’habitat',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _showAddEquipmentModal(context);
                            },
                            icon: Icon(Icons.add_circle,
                                color: CustumTheme.orangeMainColor))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        color: CustumTheme.orangeMainColor,
                        height: 1,
                      ),
                    ),
                    Expanded(
                      child: AnimatedList(
                        key: _listKey,
                        initialItemCount: equipmentList.length,
                        itemBuilder: (context, index, animation) {
                          return _buildItem(
                              equipmentList[index], animation, index);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
      Equipment equipment, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          leading: Icon(
            Icons.device_hub,
            color: CustumTheme.orangeMainColor,
          ),
          title: Text(equipment.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('QT: ${equipment.quantity}'),
              Text('PW: ${equipment.power}'),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _removeItem(index);
            },
          ),
        ),
      ),
    );
  }
}
