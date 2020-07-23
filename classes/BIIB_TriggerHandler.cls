public virtual class BIIB_TriggerHandler implements IBIIB_TriggerHandler
{
    public virtual Boolean IsDisabled(){return false;}
	
	//Iterator Methods
    public virtual void beforeInsertIterator(List<SObject> newItems) {}

    public virtual void beforeUpdateIterator(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    
    public virtual void afterInsertIterator(List<SObject> newItems, Map<Id, SObject> newMap) {}
    
    public virtual void afterUpdateIterator(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    //Trigger Context Methods
    public virtual void BeforeInsert(List<SObject> newItems) {}
    
    public virtual void BeforeUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    
    public virtual void BeforeDelete(Map<Id, SObject> oldItems) {}
    
    public virtual void AfterInsert(List<SObject> newItems, Map<Id, SObject> newMap) {}
    
    public virtual void AfterUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldItems) {}
    
    public virtual void AfterDelete(Map<Id, SObject> oldItems) {}
    
    public virtual void AfterUndelete(Map<Id, SObject> oldItems) {}
 
}