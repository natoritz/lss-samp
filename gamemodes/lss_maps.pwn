LoadPNSGates()
{
    //printf("Loading - Mapping for Pay n Sprays were loaded.");
    CreateDynamicObject(975, 2071.54492, -1831.11218, 14.36484,   0.00000, 0.00000, 90.24015); //Idlewood
    CreateDynamicObject(975, 489.31689, -1735.36963, 12.28431,   0.00000, 0.00000, -9.29999); //Santa Maria
    CreateDynamicObject(975, 1025.51855, -1029.07166, 32.99280,   0.10000, 0.00000, 0.60000); //Temple
    CreateDynamicObject(975, 720.23773, -462.52246, 16.82595,   0.00000, 0.00000, 0.00000); //Dillimore
    CreateDynamicObject(975, -100.14352, 1111.52502, 21.05994,   0.00000, 0.00000, -0.18000); //Fort Carson
    CreateDynamicObject(975, -1420.64014, 2591.10156, 56.81979,   0.00000, 0.00000, 0.00000); // El Qua ...
    CreateDynamicObject(975, -1904.89099, 277.66046, 42.35647,   0.00000, 0.00000, 0.00000); // San Fierro
    CreateDynamicObject(971, 1843.30322, -1855.43030, 12.00000,   0.00000, 0.00000, 90.00000); // Unity Station Bomber
    return true;
}

LoadModGates()
{
    //printf("Loading - Mapping for Mod Shops were loaded.");
    CreateDynamicObject(975, -2716.25415, 216.96049, 5.12531,   0.00000, 0.00000, -90.18002); // San Fierro West
    CreateDynamicObject(975, -1935.89844, 238.90338, 35.02308,   0.00000, 0.00000, 1.26000); // San Fierro West
    CreateDynamicObject(975, 2386.47534, 1043.29553, 11.49380,   0.00000, 0.00000, 0.00000); // Las Venturas
    CreateDynamicObject(971, 2644.84448, -2039.59863, 11.46750,   0.42000, 89.73997, 0.96000); // Seville
    CreateDynamicObject(975, 1042.38208, -1025.86584, 32.61161,   0.00000, 0.00000, 0.00000); // Temple
    return true;
}

stock AddHousesInteriors()
{
    //2 Room house
    CreateDynamicObject(14755, -79.76019, 1375.42126, 1079.20508,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, -80.68050, 1382.76636, 1077.94690,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house

    //2 Room house
    CreateDynamicObject(14756, -48.48457, 1458.49207, 1086.61377,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, -47.69450, 1457.73669, 1084.60840,   0.00000, 0.00000, 90.00000); //Door
    //2 Room house

    //3 Room house
    CreateDynamicObject(14748, 41.38534, 1440.95935, 1083.41199,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 46.51220, 1438.62793, 1081.40894,   0.00000, 0.00000, 90.00000); //Door
    //3 Room house

    //3 Room house & two story
    CreateDynamicObject(14750, 11.03331, 1314.19482, 1088.33093,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 6.96000, 1304.85022, 1081.82263,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house & two story

    //4 Room house & two story
    CreateDynamicObject(14754, 85.66241, 1280.42249, 1082.82739,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 82.19940, 1271.31091, 1078.86523,   0.00000, 0.00000, 0.00000); //Door
    //4 Room house & two story

    //4 Room house & two story (More expensive)
    CreateDynamicObject(14758, 155.35648, 1409.17212, 1087.30750,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 154.62061, 1409.09656, 1085.43335,   0.00000, 0.00000, 0.00000); //Door
    CreateDynamicObject(1506, 156.12061, 1409.09656, 1085.43335,   0.00000, 0.00000, 0.00000); //Door
    //4 Room house & two story (More expensive)

    //3 Room house
    CreateDynamicObject(14714, 289.94763, 1509.23218, 1079.22510,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 289.17270, 1501.17688, 1077.42126,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house

    //3 Room house
    CreateDynamicObject(14700, 329.35416, 1516.43005, 1086.31531,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 328.56949, 1512.34375, 1084.81165,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house

    //2 Room house
    CreateDynamicObject(14711, 382.01254, 1498.42480, 1080.69409,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 391.08289, 1505.09924, 1079.09644,   0.00000, 0.00000, 90.00000); //Door
    //2 Room house

    //3 Room house
    CreateDynamicObject(14710, 366.74869, 1381.78625, 1080.31787,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 376.35840, 1377.81616, 1078.80579,   0.00000, 0.00000, 90.00000); //Door
    //3 Room house

    //3 Room house
    CreateDynamicObject(14701, 448.67178, 1363.61853, 1083.28748,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 447.54770, 1353.26965, 1081.21570,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house

    //4 Room house & 2 story
    CreateDynamicObject(14703, 506.95187, 1366.91003, 1080.07947,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1504, 508.85950, 1353.45654, 1075.78345,   0.00000, 0.00000, 0.00000); //Door
    CreateDynamicObject(14722, 510.94690, 1363.57544, 1078.67737,   0.00000, 0.00000, 0.00000); //Stairs
    CreateDynamicObject(14724, 510.99319, 1363.60266, 1078.67590,   0.00000, 0.00000, 0.00000); //Stairs
    CreateDynamicObject(14715, 510.92340, 1363.51001, 1078.70215,   0.00000, 0.00000, 0.00000); //Stairs
    CreateDynamicObject(14723, 510.91971, 1363.70605, 1078.84021,   0.00000, 0.00000, 0.00000); //Stairs
    //4 Room house & 2 story

    //3 Room house & strip
    CreateDynamicObject(14736, 755.25836, 1419.45801, 1102.58032,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(14738, 753.20190, 1415.76831, 1104.04199,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1504, 744.47321, 1411.75403, 1101.42236,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house & strip

    //2 Room house
    CreateDynamicObject(14713, 289.97849, 1289.53406, 1079.25183,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 294.37189, 1284.51709, 1077.43616,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house

    //2 Room house
    CreateDynamicObject(14718, 188.29053, 1293.25732, 1081.13208,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 190.53439, 1288.35291, 1081.13416,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house

    //2 Room house
    CreateDynamicObject(14712, 287.90448, 1249.52588, 1083.25146,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 290.09601, 1241.95874, 1081.70117,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house

    //2 Room house
    CreateDynamicObject(14709, 245.01108, 1155.45520, 1081.63599,   0.00000, 0.00000, 0.00000); //Interior
    //2 Room house

    //3 Room house
    CreateDynamicObject(14735, 342.67169, 1081.66528, 1082.87891,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 325.45471, 1074.26355, 1081.25549,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house

    //Richman house 5 rooms & 2 bathrooms
    CreateDynamicObject(14708, 200.11450, 1119.56934, 1083.97693,   0.00000, 0.00000, 0.00000); //Interior
    //Richman house 5 rooms & 2 bathrooms

    //Richman house 5 rooms & 2 bathrooms
    CreateDynamicObject(14706, 277.86502, 1069.62952, 1085.65552,   0.00000, 0.00000, 0.00000); //Interior
    //Richman house 5 rooms & 2 bathrooms

    //Richman house 5 rooms & 2 bathrooms
    CreateDynamicObject(14707, 275.53461, 992.44232, 1087.27319,   0.00000, 0.00000, 0.00000); //Interior
    //Richman house 5 rooms & 2 bathrooms

    //2 Room house (Small)
    CreateDynamicObject(15029, 2265.87500, -1122.75220, 1049.62781,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1535, 2260.34570, -1121.88794, 1047.87683,   0.00000, 0.00000, 90.00000); //Door
    //2 Room house (Small)

    //1 Room house (Small)
    CreateDynamicObject(15031, 2281.78003, -1121.99768, 1049.92285,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1535, 2284.04028, -1126.90771, 1049.91650,   0.00000, 0.00000, 0.00000); //Door
    //1 Room house (Small)

    /*
    //3 Room house
    CreateDynamicObject(15055, 2374.03271, -1102.76465, 1049.87073,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1504, 2369.77124, -1094.13245, 1048.61951,   0.00000, 0.00000, 0.00000); //Door
    //3 Room house
    */

/*
    //1 Room house (Very Small)
    CreateDynamicObject(15042, 2318.45508, -1230.66187, 1048.40820,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1501, 2312.65112, -1231.38013, 1046.40540,   0.00000, 0.00000, 0.00000); //Door
    //1 Room house (Very Small)
*/

    //2 Room house (Small)
    CreateDynamicObject(15053, 2243.98071, -1024.30042, 1048.01758,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1535, 2243.21191, -1027.78198, 1046.76501,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house (Small)

    //3 Room house
    CreateDynamicObject(15054, 2260.93286, -1251.45007, 1051.05786,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 2273.48657, -1243.43054, 1047.59131,   0.00000, 0.00000, 90.00000); //Door
    //3 Room house

    //4 Room house
    CreateDynamicObject(15041, 2158.54736, -1220.96997, 1050.11694,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 2149.11328, -1216.07935, 1048.11365,   0.00000, 0.00000, 0.00000); //Door
    //4 Room house

    //2 Room house
    CreateDynamicObject(15046, 2364.22144, -1082.74231, 1048.01733,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1498, 2363.47827, -1075.46021, 1046.76379,   0.00000, 0.00000, 0.00000); //Door
    //2 Room house

    //4 Room house (Rich man big)
    CreateDynamicObject(15048, 2364.55444, -1179.42346, 1055.79187,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(15059, 2364.56909, -1179.41418, 1055.79187,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1506, 2372.00317, -1184.51221, 1052.20117,   0.00000, 0.00000, 0.00000); //Door
    CreateDynamicObject(1506, 2373.50317, -1184.51221, 1052.20117,   0.00000, 0.00000, 0.00000); //Door
    //4 Room house (Rich man big)

    //Only one room (TINY for las colinas)
    CreateDynamicObject(14859, 245.20708, 321.97745, 1000.59143,   0.00000, 0.00000, 0.00000); //Interior
    //Only one room (TINY for las colinas)

    //Only one room (TINY for las colinas)
    CreateDynamicObject(14865, 269.22012, 322.22049, 998.14349,   0.00000, 0.00000, 0.00000); //Interior
    //Only one room (TINY for las colinas)

    //Only one room (TINY for las colinas)
    CreateDynamicObject(14889, 363.51450, 304.98868, 998.14722,   0.00000, 0.00000, 0.00000); //Interior
    //Only one room (TINY for las colinas)

    //Only one room (TINY for las colinas)
    CreateDynamicObject(15033, 2177.35718, -1069.85181, 1049.47449,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1535, 2190.13110, -1074.29504, 1049.47742,   0.00000, 0.00000, 90.00000); //Door
    //Only one room (TINY for las colinas)

    //Only two rooms (TINY for las colinas)
    CreateDynamicObject(15034, 2254.38940, -1108.71704, 1049.87268,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(1535, 2254.09644, -1113.33044, 1048.11633,   0.00000, 0.00000, 0.00000); //Door
    //Only two rooms (TINY for las colinas)

    //Only two rooms (TINY for las colinas)
    CreateDynamicObject(15030, 2293.09204, -1092.09229, 1049.62341,   0.00000, 0.00000, 0.00000); //Interior
    CreateDynamicObject(2904, 2298.69800, -1093.70605, 1048.97290,   0.00000, 0.00000, 90.00000); //Door
    CreateDynamicObject(1535, 2298.64600, -1094.47375, 1047.87195,   0.00000, 0.00000, 90.00000); //Door
    //Only two rooms (TINY for las colinas)
}

stock LoadTollBooths()
{
    printf("Loading - Mapping for Toll Booths were loaded.");

    // LS-LV
    CreateDynamicObject(8168, 1789.83203125, 703.189453125, 15.846367835999, 0.000000, 3, 99.24951171875, -1);
    CreateDynamicObject(8168, 1784.8334960938, 703.94799804688, 16.070636749268, 0.000000, 357, 278.61096191406, -1);
    CreateDynamicObject(966, 1781.4122314453, 697.32531738281, 14.636913299561, 0.000000, 0.000000, 348.09008789063, -1);
    CreateDynamicObject(996, 1767.3087158203, 700.50506591797, 15.281567573547, 0.000000, 0.000000, 346.10510253906, -1);
    CreateDynamicObject(997, 1781.6832275391, 697.34796142578, 14.698781013489, 0.000000, 3, 77.41455078125, -1);
    CreateDynamicObject(997, 1792.7745361328, 706.38543701172, 13.948781013489, 0.000000, 2.999267578125, 81.379638671875, -1);
    CreateDynamicObject(966, 1793.4289550781, 709.87982177734, 13.636913299561, 0.000000, 0.000000, 169.43664550781, -1);
    CreateDynamicObject(996, 1800.8060302734, 708.38299560547, 14.281567573547, 0.000000, 0.000000, 346.10229492188, -1);

    //Richman
    CreateDynamicObject( 8168, 612.73895263672, -1191.4602050781, 20.294105529785, 0.000000, 5, 318.31237792969, -1 );
    CreateDynamicObject( 8168, 620.47265625, -1188.49609375, 20.044105529785, 0.000000, 352.99621582031, 138.94409179688, -1 );
    CreateDynamicObject( 966, 613.97229003906, -1197.7174072266, 17.475030899048, 0.000000, 0.000000, 23.81982421875, -1 );
    CreateDynamicObject( 997, 614.33209228516, -1194.3870849609, 17.709369659424, 0.000000, 0.000000, 266.70568847656, -1 );
    CreateDynamicObject( 973, 602.98425292969, -1202.1643066406, 18.000516891479, 0.000000, 0.000000, 19.849853515625, -1 );
    CreateDynamicObject( 966, 619.42913818359, -1181.6597900391, 18.725030899048, 0.000000, 0.000000, 214.37744140625, -1 );
    CreateDynamicObject( 973, 629.68823242188, -1176.0551757813, 19.500516891479, 0.000000, 0.000000, 21.831787109375, -1 );
    CreateDynamicObject( 997, 619.26574707031, -1181.6518554688, 18.709369659424, 0.000000, 0.000000, 268.68908691406, -1 );

    //Flint
    CreateDynamicObject( 8168, 61.256042480469, -1533.3946533203, 6.1042537689209, 0.000000, 0.000000, 9.9252624511719, -1 );
    CreateDynamicObject( 8168, 40.966598510742, -1529.5725097656, 6.1042537689209, 0.000000, 0.000000, 188.5712890625, -1 );
    CreateDynamicObject( 966, 35.889751434326, -1526.0096435547, 4.2410612106323, 0.000000, 0.000000, 270.67565917969, -1 );
    CreateDynamicObject( 966, 67.093727111816, -1536.8275146484, 3.9910612106323, 0.000000, 0.000000, 87.337799072266, -1 );
    CreateDynamicObject( 973, 52.9794921875, -1531.9252929688, 5.090488910675, 0.000000, 0.000000, 352.06005859375, -1 );
    CreateDynamicObject( 973, 49.042072296143, -1531.5065917969, 5.1758694648743, 0.000000, 0.000000, 352.05688476563, -1 );
    CreateDynamicObject( 997, 68.289916992188, -1546.6020507813, 4.0626411437988, 0.000000, 0.000000, 119.09942626953, -1 );
    CreateDynamicObject( 997, 34.5198097229, -1516.1402587891, 4.0626411437988, 0.000000, 0.000000, 292.50622558594, -1 );
    CreateDynamicObject( 997, 35.903915405273, -1525.8717041016, 4.0626411437988, 0.000000, 0.000000, 342.13012695313, -1 );
    CreateDynamicObject( 997, 63.914081573486, -1535.7126464844, 4.0626411437988, 0.000000, 0.000000, 342.130859375, -1 );

    // Blueberry Sað
    CreateDynamicObject(966, 614.42188, 350.81711, 17.92480,   0.00000, 0.00000, 35.00000);
    CreateDynamicObject(966, 602.91162, 342.59781, 17.92480,   0.00000, 0.00000, 215.92000);

    // Blueberry Sol
    CreateDynamicObject(966, -190.35580, 254.64290, 11.07090,   0.00000, 0.00000, 345.00000);
    CreateDynamicObject(966, -204.00880, 258.30411, 11.07090,   0.00000, 0.00000, -195.00000);

    return true;
}