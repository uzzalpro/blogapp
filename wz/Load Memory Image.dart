import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:core';

import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Widget Example', // used by the OS task switcher
      theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Text Widget Example"),
            // backgroundColor: Colors.blue,
          ),
          body: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String filePath = "";

  Future<void> checkPermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        filePath = '/storage/emulated/0/Download/IMG-20230224-WA0008.jpg';
      });
    } else {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    //checkPermission();
    String BASE64_STRING =
        '/9j/4AAQSkZJRgABAQEASABIAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gNTAK/9sAQwAQCwwODAoQDg0OEhEQExgoGhgWFhgxIyUdKDozPTw5Mzg3QEhcTkBEV0U3OFBtUVdfYmdoZz5NcXlwZHhcZWdj/9sAQwEREhIYFRgvGhovY0I4QmNjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2Nj/8AAEQgCcgJyAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A7+ilooASilooASilpKACilooASiiloASilooASilooASilooASilooASilooASilooASilpKACilooASilooASilooASilooASiiloASilooASilooASilooASiiloASilooASilooASilpKACilooASilooASiiloASilooASilooASilooASilooASiiloASilooASilooASilooASilooASiiloASilooASilooASiiigBaSlooAKSlooAKKKKACiiigAooooAKKKSgBaKKKACiiigAooooAKKKSgBaKKKACiiigAoopKAFooooAKKSloAKKKKACiiigAoopKAFoopKAFopKWgAooooAKKKKACiikoAWiiigAooooAKKKKACiiigAopKWgBKWkpaACiiigAooooAKSiloAKKKKACikooAWikpaACiikoAWikpaACiiigAopKWgBKKWigApKWigBKKWigAooooAKKSigBaKKKAEpaSloAKKKKACikooAWiiigAooooAKKKKACikooAWiikoAWikooAKWikoAKWikoAWikooAKKKKAFpKKKAFooooAKKSigBaSiloASlpKKAFpKKKAFopKKAFopKKAFopKKAClpKKAFopKKAFopKKACiiigAooooAWikooAWikpaAEpaSigAooooAWikooAKWkooAWikooAKKKKACilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASilooASiiloASilooASilooASiiigAopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEoooNACZpazrG5+1Xly4OY02ov65rRptW0EndXCilopDEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEopaKAEooooAKKWigBKKKWgBKKWigApKWkoAKKKKACiiigBaSlooASiiloASiiigApaSloASiiigAooooAKKWkoAKKKWgBKKWigBKKWkoAKKKKACiiigAopaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKzdavPs1oUU/vJPlHsO5q+7rGhdjhQMk1yN/dG7umlP3eij0Fa0Yc0jCvU5VY2vDiYs3Y/xP8A0rXqhoqbNNiz1bJ/Wr9TUd5MumrQQUUUVBoFFFLQAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUtJQAUtJS0AJRS0UAJRS0UAJRRS0AJRRRQAUUtJQAUUUtACUUtFACUUtFACUUtJQAUUUUAFFFLQAlFFFABRRS0AJRS0lABRS0lABRS0lABRS0UAJS0lLQAlFFLQAlFFFABRRRQAUUUUALSUtJQAUUUUAFFFFABRRVPUrwWVuW4Ltwg9TTSu7IUpKKuzO169/wCXWM9eXP8ASsMU5mZ3LucsxyTUtnH5t3CnZmGa74xUInlzm6kzrLWPyraKP+6oFTUg6Uteez1ErIKKKKBhRRRQAtJRRQAUUUtACUUUtACUUUtACUUUtACUUtJQAtFJRQAUUtJQAtJS0lABRS0lAC0lFLQAlFFLQAlFFLQAlFLSUAFFLRQAlFLRQAlFLRQAlFLRQAlFLSUAFFLRQAlFLSUAFFFLQAlFFFABRS0lABRS0UAJRS0lABRS0lABRRS0AJRRS0AJRS0UAJRS0lABRS0UAJRS0UAJRRRQAUUUhIAyaAGTSpDE0jnCqMk1yd9dteXDSNwvRV9BVnVtQ+1SeXGf3Kn/AL6PrWfXbRp8vvM87EVuZ2WwVpaFFvvt/aNSazq6DQIdts8pHLtx9B/k1daVoGdCPNURrUUtJXnnqhRS0UAJRRRQAUUtFACUUUtACUUUtACUUUtACUUtFACUUUtACUUUUAFFLRQAlFLSUAFFLRQAlFFLQAlFLRQAUlLRQAlFLRQAlFLRQAlFLRQAlFLRQAlFLRQAlFLRQAlFFLQAlFLRQAlFFLQAlFLRQAlFLRQAlFLRQAlFLRQAlFLSUAFFLSUAFFLRQAlFLRQAlFLRQAlFLRQAlFLSUAFFFGaACsDWdS3FraA8dHYd/apdX1PZm3t2+f8AiYfw+1YVdVGlf3mcWIr/AGYhS0UtdZwXFAycDrXW2kQgto4v7q1z+kQedfJkfKnzGunrjxEtbHfhIaOQUUUtcx2iUUtFACUUtFACUUtFACUUtFACUUtFACUUtFACUUtFABSUtFABRSUUALRRRQAlLRRQAUUUUAFFFJQAtFFFABRRRQAUUUUAFFJS0AFJS0lAC0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFJS0UAFFFFABRRRQAUUUUAFFFFABSUtFABRRRQAUUUUAFFJRQAtJS0maACsbVdU8vMFu3z9GYfw/8A16Zqmq4zBbNz0Zx2+lYtdNKjfWRxV8Rb3YhRRTq7EcDdxKWlqaztzc3KRDoev0pN2VxJczsja0W38q1MjD5pOfw7Vp01VCqFAwB0p1ebJ8zue1TjyxSFopKKksWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASilooAKSlooAKKKKAEopaKACkpaKACkpaKACkpaKACkpaKAEopaKAEpaKKAEopaKAEopaKAEpaKKACkpaKACiiigBKWiigApKWigApKWigAooooASlopKACloooAKSlooAKKKKACkpaKAEpaKKAEooqG4uI7aMvKwVRRuJu25IzBAWYgAdSa5/UtVM2YbckJ3b+9UGoalJeNtGUiH8Pr9apV2UqNtZHBWxF9IhRS0tdJxNgKWilpiErf0W18qEzMPmk6fSsvT7X7VchT9xeWrpgMDA6VyYif2UduEpXfOx1NYgAk9KdXO+KNT8mH7FC372UfPj+Ff8A69c0YuTsjunJRV2bsEqzwpKhyrjcp9qlqK2jENtFH/cQL+lS1LKQUtJS0DCkpaKAEpaKKACkpaKACiiigBKWiigAooooASilooASiiigAooooAWikooAWikooAKKKKAClpKKAFpKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaSiigAooooAKKKKACiiigAooooAKKKKACiiigAopruqKWYgAdSaw7/Wicx2n0Mn+FVCDk9DOdSMFdmhf6lFZrt+/J2Uf1rnLm5lupN8rZ9B2FREliWYkk85NFd1OkoHnVa0phS0UtanOFLRS0CCnIpdgijJPAFJW3pFjsAnkHzH7o9BUVJqCuaUqbqSsXLC1FpAF/iPLH3q1RVPUL+HT7czTH/dXPLGvO1kz10lCPkRatqUem2pc8yHiNfU/wCFcbZ+ZfatEZSXeSUFifrzTL68lv7lppjyeg7KPStHwrB5mq+YekSk/wBP612xp+zg29zhlU9rUSWx2o6UUUVwnohRRRQAUUUUALSUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFLSUUALSUUUALRSUUAFLSUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUALSUUUAFFFFABRRRQAtJRRQAUUUUAFLSUUAFFF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5S0gB9fLFW6Kjml3K5I9hqqqjCgAe1OoopDsFFFFAwoopaAEoopaAEopaSgAopaSgAoopaAEooooAKKWigBKKWigBKKKKACiiloASiiloASilpKACiiigAooooAKKWigBKKWigBKKKWgAooooAKSiigAooooAWkoooAWkoooAWikooAKKKKACiiigAooooAKKKbIcRsfagDmPEc2LeOPu7bj+H/6659Rlq0tfk334TsigfnzVCMcV6VGNoI8XFTvNi4rU0XS/t0/mSj/AEeM8j+8fSqdpbvdXKQp1c9fSu2toEtYEhjGFUYrOvU5VZFYSjzy5nsiVQAAAOKdRRXCexYKKKKACiiigBaKSigApjosilXUMp6gjIp9FAWOb1PwyrkyWJCN/wA826H6GuYubaa1kMc8bRt6MK9LqG4tobqPZPGsi+jCuiniJR0ZzVMPGWq0PMyKQiuwvPClvIS1tK0J/ut8wrLm8K6gh+TypB/stj+ddUa8H1OZ0ZroYBFICVbcpII6EVsHw3qpOPs3/kRf8alj8J6i/wB/yo/95s/ypupDuOMJdipaeIdTtMBbgyr/AHZfm/8Ar/rW3aeMomwt3bMp/vRnd+lLbeDYhg3V07/7Ma4/U1tWek2Njg29uit/eIy35muWpOk9kdMIzW5Zt50uIVljDhW6blKn8jU1FFcx0C0lFFABRRRQAUUUUAFFFFABRRRQAtJRRQAUUUUAFFFFABRRRQAUtJRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRS0UAJRRS0AJRS0UAJRRRQAtJRRQAUUtFACUUtFACUUtFACUUtFACVHOcQtUlQ3RxbsfShbib0OE1B/Mv52/2yPy4pqjAFNzvkJPUnNTwRNNMkS9XYAV6q92J89UblM6Dw1Z+XC1y4+Z+F+lbtMgiWGFI14VQAKkrzJy5pXPdo0/ZwUQoopak1EopaKAEopaKAEopaKAEopaSgAopaKAEopaKAEopaKAEooooAKKWigBKKWigBKKWkoAKKWigBKKWigBKKWigBKKWkoAKKWigBKKWigBKKWigBKKWigBKKWigBKKKWgBKKWkoAKKWigBKKWigBKKWigBKKWigBKKWkoAKKWigBKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqpqbbbCZvRT/KrdUdY40u4/3DTjuRPSLOIjHzVteHYPMv8AzCOI1z+J/wAmsiIda6jw1FttZJO7tj8B/k131pWgeLhoc9ZG1RRS1557olFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAtJRRQAUUUUAFLSUUALSUUUALSUUUAFUtYGdKuP8AcNXaq6mN2m3I/wCmbfypx3In8LOKiHy12OkR+XpsI9Rn8+a5GIfJXbWyeXbxp/dUD9K6cQ9EjzsFH32yaiiiuU9QKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigBaSiigAooooAWkoooAKKKKAClpKKACiiigAooooAKWkooAKKKKACiiigAooooAWkoooAWkoooAKKKKACiiigAooooAKWkooAKKKKAFopKKACiiigBaKSigBaKKSgApaKSgBaSlpKACiiloAKKKSgAooooAKKKWgApKKKACorhPMt5E/vKRUtIehoQnscTAu4KPU12y9K5GKLZeCP8Auy7f1rrx0Fb1nexxYSNnIKKKKwO4WkopaAEopaSgAopaSgBaSiigAooooAKKWkoAKKKWgApKKKACiiloASiiigAoopaAEopaSgAopaKAEooooAKKKKACiiigAopaSgAooooAKKKKACiiigAopaSgAooooAKKWkoAKKKWgBKKWigBKKKKACilpKACilpKACilooAKKSigApaSigBaKKSgBaSiigApaSigBaKSigBaKSloAKSiloASiiigDnLiPy9ZI7GVT+eK6MdKyNTjxf28vrgfkf8A69a46VcndI56UbSkLRSUVB0C0UlFABS0lFAC0UlFAC0UlFAC0lFFAC0UlFABS0lFABRRRQAtFJRQAtJRRQAtJRRQAUtJRQAtFJRQAUtJRQAtJRRQAUUUtACUtJRQAtFJRQAUtJRQAtFJRQAtJRRQAUtJRQAtFJRQAtFJRQAtFJRQAtFJRQAtJRRQAtJRRQAUUUUALRRRQAUUUUAFFFFABSUtFABRRRQAUUUUAJS0UUAFFFFACUUtJQBT1GPfAGHVGDVcprqHQqehGKdQSlrcKWkpaCgpKWigAooooASlopKAFoppYDuKTev94fnQA+kpvmJ/eFJ5qf3qAJKKi85P736UecnqaAJaSo/PT1NHnp70AS0lR+envR56e9AElLUXnp7/AJUeenvQBLSVH56e/wCVHnJ60AS0lR+cn979KXzU/vUAPpaZ5if3hRvX+8PzoAfRTcg96dQAlLRRQAUUUUAFFFFABSUtFACUtFFABSUtFABSUtFABRSUtABSUtFACUtFFACUUtFABRRRQAlFLRQAUlLRQAlFLRQAlFLRQAUlFFAC0UUlAC0UlFABS0UUAFFJS0AFJRS0AFJRS0AJRRRQAUtFFACUUUtACUUtFACUUtFACVFIZc/L0qakoAqkyd91MOe9XaCKAKNFXdi/3R+VJ5af3RQBUpKt+Un92k8lPT9aAK1JVryE9DR5Ce9AFWlqx5Ce9HkJ70AV6KsfZ19TR9nX1NAFalqx9nX1NH2dPU0AV6SrP2dPf86PIT3oAr0lWvIT0o8lP7tAFSlq2Ik/u0vlp/dH5UAUqUFu2auhVH8I/KloAqKZu26rEe/Hz4qSigBKKWkoAWkpaKAEpaKSgBaKKKACikpaAEopaSgAoopaACiiigBKKKKAClopKAClopKAFooooAKKSloAKSlpKACilooASilooAKKKKAEopaKACiiigAooooAKKKKAEpaKKACikpaACiiigApKWkoAWiiigApKWkoAWkpaKAEpaKKACiiigBKWiigAopKKAClopKAFooooAKKKKACiiigAooooASiiloAKKKKACiiigAooooAKKKKACiikoAKKWigApKWigAooooASlpKWgAopKWgAooooAKKKKACkopaACikpaACikpaAEpaSloAKKSigAooooAKKKKACiiigAopaSgAooooAKWkooAKKKKAFopKKAClpKKACiiigBaSiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKWkooAKWkooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAClpKKACiiigAooooAWikooAWikpaACiiigAooooAKKKKACiiigBKWiigAooooAKKKSgBaKSloAKKKKACiiigAooooAKKKKACiiigAoopKAFooooAKKKSgBaKKKACiikoAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEoopaAEpaSloAKSlooAKSiigAoopaAEoopaAEoopaAEooooAKKKKACiiloAKSiigAooooAKKKKAClpKKACiiigAooooAKKKKAFpKKKAFopKKACiiigBaSiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKWkooAWkoooAKKKKACiiigBaSiigBaSiigAooooAKKKKAFopKKAFooooASiiigBaSiigAooooAKKKKACiiigAooooAWiiigBKKKKAFpKKKACloooASiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAWkoooAKKKKACiiigAooooAKKKKACloooASloooASiiigBaSiigAooooAKKKKACiiigAooooAWiiigApKKKACloooASloooASiiigAooooAKKKKACiiigD//2Q==';
    Uint8List bytes = base64Decode(BASE64_STRING);
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey,
      child: Image.memory(bytes),
      // child: Image.asset('assets/images/cat.gif')
      // Image.network(
      //     'https://www.purina.co.uk/sites/default/files/styles/square_medium_440x440/public/2022-06/Abyssinian.2_0.jpg?h=da189af4&itok=yuauKvul'),
      // child: Text(
      //   'Hi, this is a test hbkhlkjlkjlj kjhkjgjh,g hmgfhgfjhf jhfmjfj,f',
      //   textAlign: TextAlign.center,
      //   // textScaleFactor: 2,
      //   // overflow: TextOverflow.ellipsis,
      //   maxLines: 2,
      //   style: TextStyle(
      //       color: Colors.red,
      //       fontSize: 22,
      //       fontStyle: FontStyle.italic,
      //       fontWeight: FontWeight.w200,
      //       letterSpacing: 2.0,
      //       wordSpacing: 10,
      //       fontFamily: 'TitilliumWeb'),
      // ),
    );
  }
}