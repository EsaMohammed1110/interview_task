import 'package:bloc_test/bloc_test.dart';
import 'package:doodleblue_interview_task/data/Business.dart';
import 'package:doodleblue_interview_task/data/Category.dart';

import 'package:doodleblue_interview_task/data/Coordinates.dart';
import 'package:doodleblue_interview_task/data/Location.dart';
import 'package:doodleblue_interview_task/screen/buisness/BusinessBloc.dart';
import 'package:doodleblue_interview_task/screen/buisness/BusinessEvent.dart';
import 'package:doodleblue_interview_task/screen/buisness/BusinessState.dart';
import 'package:doodleblue_interview_task/service/ApiService.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';


class MockApiService extends Mock implements ApiService {}

void main() {
  late BusinessBloc businessBloc;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    businessBloc = BusinessBloc(mockApiService);
  });

  tearDown(() {
    businessBloc.close();
  });

  Businesses mockBusiness=Businesses(
    id: 'VvsZAnEwU4c8Xkyrzx05Nw',
    name: 'Anytime Kitchen',
    imageUrl: 'https://s3-media3.fl.yelpcdn.com/bphoto/APN3oda1GREsCVa9M8hgfw/o.jpg',
    isClosed: false,
    url: 'https://www.yelp.com/biz/anytime-kitchen-new-york-2?adjust_creative=BlndLX7A8uetp91dgJCDcw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=BlndLX7A8uetp91dgJCDcw',
    reviewCount: 2920,
    categories: [
      Categories(alias: 'korean', title: 'Korean'),
      Categories(alias: 'tapasmallplates', title: 'Tapas/Small Plates'),
      Categories(alias: 'bbq', title: 'Barbeque'),
    ],
    rating: 4.6,
    coordinates: Coordinates(latitude: 40.74776270790539, longitude: -73.9867793576711),
    transactions: ['delivery', 'pickup', 'restaurant_reservation'],
    location: Location(
      address1: '23 W 32nd St',
      address2: 'Fl 3',
      address3: '',
      city: 'New York',
      zipCode: '10001',
      country: 'US',
      state: 'NY',
      displayAddress: ['23 W 32nd St', 'Fl 3', 'New York, NY 10001'],
    ),
    phone: '+16466697733',
    displayPhone: '(646) 669-7733',
    distance: 4736.528034255248,
  );
  blocTest<BusinessBloc, BusinessState>(
    'emits [BusinessLoading, BusinessLoaded] when FetchBusinesses is added and businesses are fetched successfully',
    build: () {
      when(() => mockApiService.fetchBusinesses()).thenAnswer((_) async => [mockBusiness]);
      return businessBloc;
    },
    act: (bloc) => bloc.add(FetchBusinesses()),
    expect: () => [
      BusinessLoading(),
      BusinessLoaded([mockBusiness]),
    ],
  );

  blocTest<BusinessBloc, BusinessState>(
    'emits [BusinessLoading, BusinessError] when FetchBusinesses is added and fetching businesses fails',
    build: () {
      when(() => mockApiService.fetchBusinesses()).thenThrow(Exception('Failed to load businesses'));
      return businessBloc;
    },
    act: (bloc) => bloc.add(FetchBusinesses()),
    expect: () => [
      BusinessLoading(),
      const BusinessError('Failed to load businesses'),
    ],
  );
}
