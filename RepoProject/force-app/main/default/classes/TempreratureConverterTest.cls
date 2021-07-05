@isTest
private class TempreratureConverterTest {


    @isTest static void testwarmtemp(){
    decimal celcius = TemperatureConverter.convertcelcius(41);
    system.assertEquals(9, celcius);
   
}
    @isTest static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.convertcelcius(32);
        System.assertEquals(0,celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.convertcelcius(212);        
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    } 
    
    @isTest static void testNegativeTemp() {
        Decimal celsius = TemperatureConverter.convertcelcius(-10);
        System.assertEquals(-23.33,celsius);
    }



}