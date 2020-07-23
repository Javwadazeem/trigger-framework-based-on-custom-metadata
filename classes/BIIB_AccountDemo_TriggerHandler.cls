public class BIIB_AccountDemo_TriggerHandler extends BIIB_TriggerHandler
{
    public override Boolean IsDisabled()
    {
        return (BIIB_Trigger_Inactivation__c.getInstance() != null && BIIB_Trigger_Inactivation__c.getInstance().BIIB_Disable_Account_Trigger__c);
    }
    public override void beforeInsertIterator(List<SObject> newItems) 
    {
        System.debug('Before Insert Iterator ');
    }
    //Iterator Methods
    public override void beforeUpdateIterator(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) 
    {
        System.debug('Before Update Iterator');
    }
    public override void afterInsertIterator(List<SObject> newItems, Map<Id, SObject> newMap) 
    {
        System.debug('After Insert Iterator ');
    }
    // Trigger Context Methods
    public override void BeforeInsert(List<SObject> newItems) 
    {
        System.debug('In Before Insert ');
    }
    public override void BeforeUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) 
    {
        System.debug('In Before Update ');
    }
    public override void BeforeDelete(Map<Id, SObject> oldItems) 
    {
        System.debug('In Before Delete ');
    }
    public override void AfterInsert(List<SObject> newItems, Map<Id, SObject> newMap) 
    {
        System.debug('In After Insert ');
    }
    public override void AfterUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldItems) 
    {
        System.debug('In After Update ');
    }
}