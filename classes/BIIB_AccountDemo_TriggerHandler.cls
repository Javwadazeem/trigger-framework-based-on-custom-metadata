public class BIIB_AccountDemo_TriggerHandler extends BIIB_TriggerHandler
{
    public override Boolean IsDisabled()
    {
        return false;
    }
    //Iterator Methods
    public override void beforeInsertIterator(List<SObject> newItems) {}
    public override void beforeUpdateIterator(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    public override void afterInsertIterator(List<SObject> newItems, Map<Id, SObject> newMap) {}
    // Trigger Context Methods
    public override void BeforeInsert(List<SObject> newItems) {}
    public override void BeforeUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    public override void BeforeDelete(Map<Id, SObject> oldItems) {}
    public override void AfterInsert(List<SObject> newItems, Map<Id, SObject> newMap) {}
    public override void AfterUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldItems) {}
}
