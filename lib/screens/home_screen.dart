import 'package:flutter/material.dart';
import 'package:second_homework/logic/metrics_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _enteredAmount = 0;
  String? _fromMetric;
  String? _toMetric;
  double _resultAmount = 0;
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  final List<String> _metrics = [
    'cm',
    'm',
    'km',
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Listener(
      onPointerDown: (_) => _focusNode.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Metrics Converter',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(31, 69, 252, .9)),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Number:',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: Center(
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _textEditingController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.blue,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                var amount = double.tryParse(text);
                                if (amount != null) {
                                  _enteredAmount = amount;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent, shape: BoxShape.circle),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'To:',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                ),
                                width: 100,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      selectedItemBuilder: (_) => _metrics
                                          .map((e) => Center(child: Text(e)))
                                          .toList(),
                                      iconEnabledColor: Colors.blue,
                                      value: _fromMetric,
                                      borderRadius: BorderRadius.circular(35),
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                      items: _metrics
                                          .map(
                                            (metric) =>
                                                DropdownMenuItem<String>(
                                              value: metric,
                                              child: Text(
                                                metric,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _fromMetric = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'From:',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                ),
                                width: 100,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      selectedItemBuilder: (_) => _metrics
                                          .map((e) => Center(child: Text(e)))
                                          .toList(),
                                      iconEnabledColor: Colors.blue,
                                      value: _toMetric,
                                      borderRadius: BorderRadius.circular(35),
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                      items: _metrics
                                          .map(
                                            (metric) =>
                                                DropdownMenuItem<String>(
                                              value: metric,
                                              child: Text(
                                                metric,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _toMetric = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Result:',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Container(
                          height: 40,
                          width: 120,
                          child: Center(
                            child: Text(_resultAmount.toString()),
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          )),
                    ],
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          'CONVERSION',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_fromMetric == null ||
                              _toMetric == null ||
                              _enteredAmount == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please choose everything!'),
                              ),
                            );
                          } else {
                            setState(() {
                              _resultAmount = CurrencyHelper().convertTo(
                                  _enteredAmount, _fromMetric, _toMetric);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          'RESET',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            _enteredAmount = 0;
                            _resultAmount = 0;
                          });
                        },
                      ),
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
