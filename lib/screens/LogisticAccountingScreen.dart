// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, prefer_const_constructors_in_immutables, deprecated_member_use, non_constant_identifier_names, unused_element, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistic_app/utils/app_sizer.dart';
import 'package:logistic_app/utils/contants.dart';

class LogisticAccountingScreen extends StatefulWidget {
  const LogisticAccountingScreen({Key? key});

  @override
  State<LogisticAccountingScreen> createState() =>
      _LogisticAccountingScreenState();
}

class _LogisticAccountingScreenState extends State<LogisticAccountingScreen> {
  bool isSelected = false;
  DateTime? startTime;
  DateTime? endTime;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    endTime = DateTime.now().add(Duration(days: 7));
  }

  // Select start date
  Future<void> _selectStartDate(BuildContext context) async {
    DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: startTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedStartDate != null && pickedStartDate != startTime) {
      setState(() {
        startTime = pickedStartDate;
      });
    }
  }

  // Select end date
  Future<void> _selectEndDate(BuildContext context) async {
    DateTime? pickedEndDate = await showDatePicker(
      context: context,
      initialDate: endTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedEndDate != null && pickedEndDate != endTime) {
      setState(() {
        endTime = pickedEndDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                15.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/İkon-payment/1.png"),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 55,
                      child: Image.asset(
                          "assets/welcome/lojistik-maldia-logo-1.png"),
                    ),
                    const Spacer(),
                    Badge(
                      label: const Text('3'),
                      child: Icon(
                        Icons.notifications,
                        color: AppColors.appColor,
                        size: 30,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: AppColors.appColor,
                    ),
                  ],
                ),
                20.h,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            isSelected = true;
                            setState(() {});
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10)),
                                color: isSelected
                                    ? AppColors.appColor
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      10.w,
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            isSelected = false;
                            setState(() {});
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10)),
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.appColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Expenses",
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                15.h,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        isSelected ? Income() : Expenses(),
                        25.h,
                        // Spacer(),
                        Container(
                          height: 15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff0DCAF0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xff229BBD),
                                ),
                              )
                            ],
                          ),
                        ),
                        15.h,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Income Funtion
  Widget Income() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _selectStartDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(163, 92, 91, 91),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text(
                          formatStartDate(startTime),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.w,
              GestureDetector(
                onTap: () => _selectEndDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(163, 92, 91, 91),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text(
                          formatEndDate(endTime),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.w,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(163, 92, 91, 91),
                  ),
                ),
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Select Item",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              10.w,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(163, 92, 91, 91),
                  ),
                ),
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Search",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        10.h,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    price: " 5.000.000 ",
                    label: 'TR Incomes',
                    image: 'assets/İkon-payment/CS_1.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: "2.000.000 €",
                    label: 'EU Incomes',
                    image: 'assets/İkon-payment/CS_2.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 1.000.000 ",
                    label: 'US Incomes',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    price: " 500.000 ",
                    label: 'As Incomes',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 500.000 \$ ",
                    label: 'Afk Incomes',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 500.000 ",
                    label: 'Me Incomes',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                ],
              ),
            ),
          ],
        ),
        10.h,
        HorizontalButtonList(),
        20.h,
        CustomDataTable(
          columnNames: [
            'Gönder',
            'Kargo Tak',
            'Fatura no',
            'Bölge ID',
            'Ülke ID',
            'Müşter',
            'Müşter ID',
            'Dövz Kur',
            'Kar Payı',
          ],
          rowData: [
            [
              '20.05.2022',
              '53453453453/3253253225',
              '534534534',
              'Eu',
              'Pl48',
              'Elf Karanﬁl',
              '34324432',
              '\$',
              '27,379'
            ],
            [
              '21.05.2022',
              '53453453453/3253253226',
              '534534535',
              'Us',
              'Pl48',
              'Elf Karanﬁl',
              '34324433',
              '\$',
              '27,379'
            ],
            [
              '20.05.2022',
              '53453453453/3253253225',
              '534534534',
              'Eu',
              'Pl48',
              'Elf Karanﬁl',
              '34324432',
              '\$',
              '27,379'
            ],
            [
              '21.05.2022',
              '53453453453/3253253226',
              '534534535',
              'Us',
              'Pl48',
              'Elf Karanﬁl',
              '34324433',
              '\$',
              '27,379'
            ],
          ],
        ),
      ],
    );
  }

//Expenses Funtion
  Widget Expenses() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _selectStartDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(163, 92, 91, 91),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text(
                          formatStartDate(startTime),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.w,
              GestureDetector(
                onTap: () => _selectEndDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(163, 92, 91, 91),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Text(
                          formatEndDate(endTime),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.w,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(163, 92, 91, 91),
                  ),
                ),
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Select Item",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              10.w,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(163, 92, 91, 91),
                  ),
                ),
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Search",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        10.h,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    price: " 3.000.000 ",
                    label: 'TR Incomes',
                    image: 'assets/İkon-payment/CS_1.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: "1.000.000 €",
                    label: 'EU Expenses',
                    image: 'assets/İkon-payment/CS_2.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 500.000 ",
                    label: 'US Expenses',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    price: " 300.000 ",
                    label: 'As Expenses',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 300.000 \$ ",
                    label: 'Afk Expenses',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                  2.w,
                  Expanded(
                      child: CustomContainer(
                    price: " 200.000 ",
                    label: 'Me Expenses',
                    image: 'assets/İkon-payment/CS_3.svg',
                  )),
                ],
              ),
            ),
          ],
        ),
        10.h,
        HorizontalButtonListForExpenses(),
        20.h,
        CustomDataTable(
          columnNames: [
            'Gönder',
            'Kargo Tak',
            'Fatura no',
            'Bölge ID',
            'Ülke ID',
            'Müşter',
            'Müşter ID',
            'Dövz Kur',
            'Kar Payı',
          ],
          rowData: [
            [
              '20.05.2022',
              '53453453453/3253253225',
              '534534534',
              'Eu',
              'Pl48',
              'Elf Karanﬁl',
              '34324432',
              '\$',
              '27,379'
            ],
            [
              '21.05.2022',
              '53453453453/3253253226',
              '534534535',
              'Us',
              'Pl48',
              'Elf Karanﬁl',
              '34324433',
              '\$',
              '27,379'
            ],
            [
              '20.05.2022',
              '53453453453/3253253225',
              '534534534',
              'Eu',
              'Pl48',
              'Elf Karanﬁl',
              '34324432',
              '\$',
              '27,379'
            ],
            [
              '21.05.2022',
              '53453453453/3253253226',
              '534534535',
              'Us',
              'Pl48',
              'Elf Karanﬁl',
              '34324433',
              '\$',
              '27,379'
            ],
          ],
        ),
      ],
    );
  }

  String formatStartDate(DateTime? startDate) {
    if (startDate != null) {
      return "${startDate.day}/${startDate.month}/${startDate.year}  ";
    } else {
      return "20/01/2024";
    }
  }

  String formatEndDate(DateTime? endDate) {
    if (endDate != null) {
      return "${endDate.day}/${endDate.month}/${endDate.year}  ";
    } else {
      return "20/03/2024";
    }
  }
}

class CustomContainer extends StatelessWidget {
  final String price;
  final String label;
  final String image;
  const CustomContainer(
      {Key? key,
      required this.price,
      required this.label,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Color(0xffE6E6E6), width: 3.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Spacer(),
              Text(
                price,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              2.w,
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 3, right: 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff00AEFF),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: SizedBox(
                    height: 30,
                    width: 28,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(image),
                    ),
                  ),
                ),
              ),
            ],
          ),
          8.h,
          Row(
            children: [
              Spacer(),
              Text(
                "TR Incomes",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff00AEFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          5.h,
        ],
      ),
    );
  }
}

//HorizontalButtonListForIncome
class HorizontalButtonList extends StatefulWidget {
  @override
  _HorizontalButtonListState createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<HorizontalButtonList> {
  String selectedButton = 'All Income';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (String buttonLabel in [
                'All Income',
                'Malldia Income',
                'Lojistik Income',
                'Agency Income'
              ])
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedButton = buttonLabel;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: Offset(2, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: buttonLabel == selectedButton
                                ? Colors.white
                                : Color(0xff00AEFF),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                buttonLabel,
                                style: TextStyle(
                                    color: buttonLabel == selectedButton
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

//HorizontalButtonListForExpenses
class HorizontalButtonListForExpenses extends StatefulWidget {
  @override
  _HorizontalButtonListForExpensesState createState() =>
      _HorizontalButtonListForExpensesState();
}

class _HorizontalButtonListForExpensesState
    extends State<HorizontalButtonListForExpenses> {
  String selectedButton2 = 'All Expenses';

  @override
  Widget build(BuildContext context) {
    List<String> buttonLabels = [
      'All Expenses',
      'Cargo',
      'Lojistik',
      'Agency',
      'Campany',
      'Costumus',
      'Tax',
      'Insurance'
    ];

    int midIndex = (buttonLabels.length / 2).floor();

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < midIndex; i++) buildButton(buttonLabels[i]),
            ],
          ),
        ),
        10.h,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = midIndex; i < buttonLabels.length; i++)
                buildButton(buttonLabels[i]),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton(String buttonLabel) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedButton2 = buttonLabel;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 1,
                offset: Offset(2, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: buttonLabel.trim().toLowerCase() ==
                        selectedButton2.trim().toLowerCase()
                    ? Colors.white
                    : Color(0xff00AEFF),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    buttonLabel,
                    style: TextStyle(
                        color: buttonLabel.trim().toLowerCase() ==
                                selectedButton2.trim().toLowerCase()
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//CustomDataTable
class CustomDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<List<String>> rowData;

  CustomDataTable({required this.columnNames, required this.rowData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 40,
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return null;
          }
          return Color(0xff00AEFF);
        }),
        columnSpacing: 18,
        columns: columnNames
            .map((columnName) => DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        columnName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
        rows: rowData
            .map((row) => DataRow(
                  cells:
                      row.map((cellData) => DataCell(Text(cellData))).toList(),
                ))
            .toList(),
      ),
    );
  }
}
