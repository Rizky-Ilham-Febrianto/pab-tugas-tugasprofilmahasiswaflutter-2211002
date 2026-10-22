import 'package:flutter_test/flutter_test.dart';
import 'package:tugasprofilmahasiswa_2211002/viewmodels/course_viewmodel.dart';

void main() {
  test('Total SKS semester 5 = 23', () {
    expect(CourseViewModel().totalSks, 23);
  });

  test('Jumlah mata kuliah = 8', () {
    expect(CourseViewModel().jumlahMk, 8);
  });
}
