import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utilities/constants.dart';
import 'cityScreenController.dart';

class City_Search extends ConsumerWidget {
  City_Search({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: 800,
                  ),
                  padding: EdgeInsets.all(20.0),
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: kTextFieldDecoration.copyWith(
                              fillColor: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(cityNameProvider.notifier)
                                  .updateCityName(_cityController.text.trim());
                              Navigator.pop(context);
                            }
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
