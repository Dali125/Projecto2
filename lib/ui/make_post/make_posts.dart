import 'package:flutter/material.dart';

class MakePost extends StatefulWidget {
  const MakePost({Key? key}) : super(key: key);

  @override
  State<MakePost> createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  _MakePostState() {
    selected = _paymentMethod[0];
  }

  //Email and password
  final description = TextEditingController();
  final passwordController = TextEditingController();

  int _initvalue = 1;
  final _paymentMethod = ['By the hour', 'Fixed amount'];
  String selected = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    description.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post a Job',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text('Describe the Job', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Name Your Job Posting'),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Job Description',
                          hintText: 'Eg: Need help with Dish installation',
                        ),
                        controller: description,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                height: 242,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: width,
                        height: 67,
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text('How Would you like to pay'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: DropdownButtonFormField(
                          value: selected,
                          items: _paymentMethod
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selected = val as String;
                            });
                          },
                          dropdownColor:Colors.white,

                          decoration: InputDecoration(


                            border: OutlineInputBorder(

                            )
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                      child: Text('Desired Experience Level?',

                      ),
                      ),
                          Column(
                            children: [
                              Radio(value: 0,
                                  groupValue: _initvalue, onChanged: (value){

                                setState(() {
                                  _initvalue = value!;
                                });

                                  }),
                              SizedBox(width: 10,),
                              Text('Entry')
                            ],
                          ),



                          ],
                  ),
               ] ),
              )
    ),





            ]),
        ),
        ),
      );

  }
}
