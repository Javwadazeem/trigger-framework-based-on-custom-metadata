public virtual class TriggerHandler implements ITriggerHandler
{
    public virtual Boolean IsDisabled(){return false;}

    //Trigger Context Methods
    public virtual void BeforeInsert(List<SObject> newItems) {}
    
    public virtual void BeforeUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    
    public virtual void BeforeDelete(Map<Id, SObject> oldItems) {}
    
    public virtual void AfterInsert(List<SObject> newItems, Map<Id, SObject> newMap) {}
    
    public virtual void AfterUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldItems) {}
    
    public virtual void AfterDelete(Map<Id, SObject> oldItems) {}
    
    public virtual void AfterUndelete(Map<Id, SObject> oldItems) {}
 
}
