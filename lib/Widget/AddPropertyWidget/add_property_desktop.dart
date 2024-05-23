import 'package:flutter/material.dart';
import 'package:my_real_estate/Widget/AddPropertyWidget/add_property_mobile.dart';
import 'package:my_real_estate/Widget/AddPropertyWidget/add_property_tablet.dart';
import 'package:my_real_estate/Widget/FooterWidget/footer.dart';

class AddPropertyDesktop extends StatefulWidget {
  const AddPropertyDesktop({super.key});

  @override
  State<AddPropertyDesktop> createState() => _AddPropertyDesktopState();
}

class _AddPropertyDesktopState extends State<AddPropertyDesktop> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isBigTablet = MediaQuery.of(context).size.width >= 950 &&
        MediaQuery.of(context).size.width < 1250;
    return ListView(children: [
      Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isBigTablet ? 100 : 300),
          color: Color(0xfff6f6f6),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                const BasicInfoTablet(),
                SizedBox(height: 35),
                const AddLocationTablet(),
                SizedBox(height: 35),
                const Gallery(),
                SizedBox(height: 35),
                const AdditionalInfoDesktop(),
                Container(
                  decoration: BoxDecoration(
                      border: const Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              iconColor:
                                  MaterialStatePropertyAll<Color>(Colors.grey),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              )),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.save, size: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                  child: Text(
                                    'Save Draft',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                      ),
                      Container(
                        width: 120,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: const Color(0xff0000ff),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AlertDialog(
                                content: Text(
                                    'Form is not valid. Please check your input.'),
                              );
                            }
                          },
                          child: Text(
                            'Preview   >',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
      Footer()
    ]);
  }
}

class AdditionalInfoDesktop extends StatelessWidget {
  const AdditionalInfoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBigTablet = MediaQuery.of(context).size.width >= 950 &&
        MediaQuery.of(context).size.width <= 1240;
    List<String> featureOptions = [
      'Air conditioning',
      'Beding',
      'Heating',
      'Internet',
      'Microwave',
      'Smoking allowed',
      'Terrace',
      'Valcony',
      'Icon',
      'Hi-Fi',
      'Beach',
      'Parking'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'Additional Information',
            style: TextStyle(color: Colors.black54, fontSize: 24),
          ),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text(
              'Description',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            // contentPadding: EdgeInsets.all(8),
            focusColor: Colors.grey,
            fillColor: Colors.white,
            filled: true,

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
          cursorColor: Colors.black,
          cursorHeight: 20,
          cursorWidth: 0.5,
          maxLines: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'description is required';
            }
            return null;
          },
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 1, child: InputForm(title: 'Bedrooms')),
            SizedBox(
              width: 30,
            ),
            Expanded(flex: 1, child: InputForm(title: 'BathRooms')),
            SizedBox(width: 30),
            Expanded(flex: 1, child: InputForm(title: 'Garages')),
          ],
        ),
        SizedBox(height: 30),
        Text(
          'Features',
          style: TextStyle(color: Colors.black54, fontSize: 14),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 10),
        Wrap(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 5,
              children:
                  featureOptions.map((item) => Checkboxs(label: item)).toList(),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
