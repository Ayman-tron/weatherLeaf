import 'package:flutter/material.dart';
import '../../../utilities/constants.dart';

class City_Search extends StatefulWidget {
  const City_Search({Key? key}) : super(key: key);

  @override
  State<City_Search> createState() => _State();
}

class _State extends State<City_Search> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  constraints: const BoxConstraints(
                    maxWidth: 800,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cityController,
                          cursorColor: Colors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a city name';
                            } else if (!RegExp(r'^[a-zA-Z\s]*$')
                                .hasMatch(value)) {
                              return 'Invalid city name';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: kTextFieldDecoration.copyWith(
                              fillColor: Colors.black.withOpacity(0.5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black.withOpacity(0.7)),
                          ), // Add a child property to show a text on your button
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
