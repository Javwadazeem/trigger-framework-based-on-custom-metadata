/****************************************************************************************************************************************************************
Interface Name:     ITriggerHandler
Description:        All Methods should be implemented by the TriggerHandler Class.
Developer:          Javwad Azeem
Date:               17/07/2020
Modification Logs:  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Developer                 Date                   Description
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
*******************************************************************************************************************************************************************/
public Interface ITriggerHandler
{    
    //Trigger Events
    void BeforeInsert(List<SObject> newItems);
 
    void BeforeUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldMap);
 
    void BeforeDelete(Map<Id, SObject> oldItems);
 
    void AfterInsert(List<SObject> newItems, Map<Id, SObject> newMap);
 
    void AfterUpdate(List<SObject> newItems, Map<Id, SObject> newMap, Map<Id, SObject> oldItems);
 
    void AfterDelete(Map<Id, SObject> oldItems);
 
    void AfterUndelete(Map<Id, SObject> oldItems);
 
    Boolean IsDisabled();
}
