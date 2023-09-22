import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherLeaf/src/features/weather/application/provider.dart';
import '../../../constants/constants.dart';

class City_Search extends ConsumerStatefulWidget {
  const City_Search({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _City_SearchState();
}

class _City_SearchState extends ConsumerState<City_Search> {
  final _formKey = GlobalKey<FormState>();

  late final _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cityController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

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
                          onFieldSubmitted: (value) {
                            ref.read(cityProvider.notifier).state = value;
                            Navigator.pop(context);
                          },
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
                            ref.read(cityProvider.notifier).state =
                                _cityController.text;
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
