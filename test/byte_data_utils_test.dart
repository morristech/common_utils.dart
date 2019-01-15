import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:tekartik_common_utils/byte_data_utils.dart';

void main() {
  group('byte_data utils', () {
    test('toFromUint8', () {
      Uint8List list = Uint8List.fromList([1, 2, 3, 4]);
      expect(byteDataToUint8List(byteDataFromUint8List(list)), [1, 2, 3, 4]);
    });

    test('fromOffset', () {
      ByteBuffer buffer = Uint8List.fromList([1, 2, 3, 4]).buffer;
      ByteData data = ByteData.view(buffer);
      expect(byteDataToUint8List(data), [1, 2, 3, 4]);

      ByteData data2 = byteDataFromOffset(data, 1);
      expect(byteDataToUint8List(data2), [2, 3, 4]);

      ByteData data3 = byteDataFromOffset(data, 1, 2);
      expect(byteDataToUint8List(data3), [2, 3]);
    });
  });
}
