public with sharing virtual class ExternalObjectModelBase {                             
    @TestVisible protected 
	List<SObject> mockedRecords = new List<SObject>();

    public void addTestRecord(SObject record) {
        mockedRecords.add(record);
    }

    public void addTestRecords(List<SObject> records) {
        mockedRecords.addAll(records);
    }
}