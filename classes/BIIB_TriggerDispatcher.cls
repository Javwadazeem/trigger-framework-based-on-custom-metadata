/****************************************************************************************************************************************************************
Class Name:         BIIB_TriggerDispatcher
Description:        Trigger Handler Dipatcher.
Developer:          Javwad Azeem
Date:               17/07/2020
Modification Logs:  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Developer                 Date                   Description
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
*******************************************************************************************************************************************************************/
public class BIIB_TriggerDispatcher 
{
    private static String triggerType;
    private static Map<BIIB_Trigger_Dispatcher__mdt, Set<System.TriggerOperation>> m_MapofHandlersByTriggerOperation = new Map<BIIB_Trigger_Dispatcher__mdt, Set<System.TriggerOperation>>();
    
    //Retrieves all Trigger dispatcher records from metadata and Store them into map key as object name and value as list of all related records.
    private static Map<String, List<BIIB_Trigger_Dispatcher__mdt>> m_MapTriggerDispatcherByObjectName
    {get{
        if(m_MapTriggerDispatcherByObjectName == null)
        {
            m_MapTriggerDispatcherByObjectName = new Map<String, List<BIIB_Trigger_Dispatcher__mdt>>();
            for(BIIB_Trigger_Dispatcher__mdt objRecord : [Select Active__c, Prevent_Recursion__c,Trigger_Handler_Class_Name__c, Object_Name__c from BIIB_Trigger_Dispatcher__mdt where Active__c = True Order By Ordinal__c ASC NULLS LAST])
            {
                if(!m_MapTriggerDispatcherByObjectName.containsKey(objRecord.Object_Name__c))
                    m_MapTriggerDispatcherByObjectName.put(objRecord.Object_Name__c, new List<BIIB_Trigger_Dispatcher__mdt>());
                m_MapTriggerDispatcherByObjectName.get(objRecord.Object_Name__c).add(objRecord);
            }
        }
        return m_MapTriggerDispatcherByObjectName;
    }private set;}
    
    private static void execute(IBIIB_TriggerHandler handler)
    {
        //Short Circuit condition -  Check to see if the trigger has been disabled. If it has, return
        if (handler.IsDisabled())
            return;
        
        // Detect the current trigger context and fire the relevant methods on the trigger handler:
        // Before trigger logic
        if (Trigger.IsBefore )
        {
            if (Trigger.IsInsert)
            {
                handler.beforeInsertIterator(trigger.new);
                handler.BeforeInsert(trigger.new);
            }
            
            if (Trigger.IsUpdate)
            {
                handler.beforeUpdateIterator(trigger.new,trigger.newMap, trigger.oldMap);
                handler.BeforeUpdate(trigger.new,trigger.newMap, trigger.oldMap);
            }
            
            if (Trigger.IsDelete)
                handler.BeforeDelete(trigger.oldMap);
        }
        
        // After trigger logic
        if (Trigger.IsAfter)
        {
            if (Trigger.IsInsert)
            {
                handler.afterInsertIterator(trigger.new, trigger.newMap);
                handler.AfterInsert(trigger.new, Trigger.newMap);
            }
            
            if (Trigger.IsUpdate)
            {
                handler.afterUpdateIterator(trigger.new, trigger.newMap, trigger.oldMap);
                handler.AfterUpdate(trigger.new, trigger.newMap, trigger.oldMap);
            }
            
            if (trigger.IsDelete)
                handler.AfterDelete(trigger.oldMap);
            
            if (trigger.isUndelete)
                handler.AfterUndelete(trigger.oldMap);
        }
    }
    public static void execute()
    {
        triggerType = trigger.isDelete ? String.valueOf(trigger.old.getSObjectType()) : String.valueOf(trigger.new.getSObjectType());
        
        //Short Circuit condition - Check whether there is any handler class available in metadata or not.
        //@Exception - Throws custom Developer Exception if there is no Handler Class for current SobjectType.
        if(m_MapTriggerDispatcherByObjectName.isEmpty() || !m_MapTriggerDispatcherByObjectName.containsKey(triggerType))
            throw new DeveloperException('Handler class not found in Trigger Dispatcher for SObjectType ' +triggerType);
        
        //Iterating records from custom metadata based on sobjectType and invoking Trigger Handler classes.
        for(BIIB_Trigger_Dispatcher__mdt objRecord : m_MapTriggerDispatcherByObjectName.get(triggerType))
        {
            try
            {
                execute((IBIIB_TriggerHandler)Type.forName(objRecord.Trigger_Handler_Class_Name__c).newInstance());
            }
            catch(TypeException ex)
            {
                throw new DeveloperException(objRecord.Trigger_Handler_Class_Name__c+' Handler class should implement IBIIB_TriggerHandler for SObjectType ' +triggerType);
            }
        }
    }
    public class DeveloperException extends Exception {} 
}