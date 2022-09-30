// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter code sample for BottomAppBar

import 'dart:developer';

import 'package:peng_flutter/SampleDemo/ListViewDemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ListTileDemo());
}

class ListTileDemo extends StatefulWidget {
  const ListTileDemo({Key? key}) : super(key: key);

  @override
  State createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {
  late bool _switchFlag = false;
  late bool _radioFlag = false;
  late bool _checkboxFlag = false;
  _onChanged(bool value) {
    setState(() {
      _switchFlag = !_switchFlag;
    });
  }

  _onChangedForRadio(bool? value) {
    setState(() {
      _radioFlag = !_radioFlag;
      log('($_radioFlag)');
    });
  }

  _onChangedForCheckbox(bool? value) {
    setState(() {
      _checkboxFlag = value!;
      log('($_radioFlag)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Bottom App Bar Demo'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: <Widget>[
            SwitchListTile(
              title: const Text(
                'Switch List Tile',
              ),
              key: const Key("0"),
              value: _switchFlag,
              onChanged: _onChanged,
            ),

            CheckboxListTile(
              title: const Text('Checkbox List Tile'),
              value: _checkboxFlag,
              onChanged: _onChangedForCheckbox,
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Radio List Tile'),
            ),

            RadioListTile<bool>(
              title: const Text('Radio 0'),
              value: false,
              groupValue: _radioFlag,
              toggleable: true,
              onChanged: _onChangedForRadio,
            ),
            RadioListTile<bool>(
              title: const Text('Radio 1'),
              value: true,
              groupValue: _radioFlag,
              onChanged: _onChangedForRadio,
            ),

            AboutListTile(
              icon: Icon(Icons.account_box, 
              color: Colors.blue.shade900,
              size: 24.0,
              semanticLabel: 'semanticLabel',
              ),
            )
          ],
        ),
      ),
    );
  }
}
