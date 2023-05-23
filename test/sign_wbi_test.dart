import 'package:bilibili_subscriber/api/get_wbi_keys.dart';
import 'package:bilibili_subscriber/utils/sign_wbi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should get a correct mixin key", () {
    final output = getMixinKey(
        imgKey: "653657f524a547ac981ded72ea172057",
        subKey: "6e4909c702f846728e64f6007736a338");
    expect(output, "72136226c6a73669787ee4fd02a74c27");
  });
  test("Should return a sorted query", () {
    final Map<String, dynamic> input = {
      "foo": '114',
      "bar": '514',
      "baz": 1919810
    };
    final output = getSortedQuery(input, orderedTime: 1684746387);
    expect(output, "bar=514&baz=1919810&foo=114&wts=1684746387");
  });
  test("Should get a signed query", () {
    final Map<String, dynamic> input = {
      "foo": '114',
      "bar": '514',
      "baz": 1919810
    };
    final output = signWbi(
        query: input,
        imgKey: "653657f524a547ac981ded72ea172057",
        subKey: "6e4909c702f846728e64f6007736a338",
        orderedTime: 1684746387);
    expect(output,
        "bar=514&baz=1919810&foo=114&wts=1684746387&w_rid=d3cbd2a2316089117134038bf4caf442");
  });
  test("Should extract key from url", () {
    const url =
        "https://i0.hdslb.com/bfs/wbi/653657f524a547ac981ded72ea172057.png";
    final output = getKey(url);
    expect(output, "653657f524a547ac981ded72ea172057");
  });
}
