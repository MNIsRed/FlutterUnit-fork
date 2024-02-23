import 'dart:async';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('Test await', () async {
    String filePath = r'/Volumes/My Passport/report.txt';
    File file = File(filePath);

    print("开始读取");

    String content = await file.readAsString();

    print("===读取完毕: 文字内容长度 = ${content.length}====");

    print("做些其他的事");

    // 在这里添加你的断言，验证读取操作是否符合预期
    expect(content.length, greaterThan(0));
  });

  test('Test then', () {
    String filePath = r'/Volumes/My Passport/report.txt';
    File file = File(filePath);
    Completer<String> completer = Completer<String>();

    print("开始读取");

    var callback = expectAsync0(() => {completer.complete("")});

    file.readAsString().then((value) {
      print("===读取完毕: 文字内容长度 = ${value.length}====");
      callback();
    });

    print("做些其他的事");
  });
}
