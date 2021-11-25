import 'package:flutter_test/flutter_test.dart';
import 'package:kotaktemu/data/model/restaurant.dart';


var testApi = {
  "id": "69ahsy71a5gkfw1e867",
  "name": "Hub Grubbert",
  "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
  "pictureId": "32",
  "city": "Balikpapan",
  "rating": 3.8
};
void main() {
  test("Running Test", () async {
    var _resut = Restaurant.fromJson(testApi).id;

    expect(_resut, "69ahsy71a5gkfw1e867");
  });
}