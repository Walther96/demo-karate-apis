function fn(){

    var urlBooker = 'https://restful-booker.herokuapp.com';

    var urlGorest = 'https://gorest.co.in';
    var pathPublicV2 = '/public/v2/';

    var config = {
        baseBooker: urlBooker,
        pathAuth: '/auth',
        pathBooking: '/booking',
        pathPing: '/ping',

        baseGorest: urlGorest + pathPublicV2,
        tokenGorest: "30182d75664e9d56aa4efb21196a298695b2340aea0aa631225a1a120e25959f",
    };

  return config;

}