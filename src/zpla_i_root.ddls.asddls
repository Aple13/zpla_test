@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS for Root'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zpla_i_root
  as select from zpla_aroot
  
  composition [1..*] of zpla_i_child1 as _Child1
  composition [1..*] of zpla_i_child2 as _Child2
  composition [1..*] of zpla_i_child3 as _Child3
  
  association [1] to zpla_i_table1 as _Assa1 on $projection.Field1 = _Assa1.KeyField1
  
{
  key root_uuid             as RootUuid,
      field_1               as Field1,
      field_2               as Field2,
      field_3               as Field3,
      field_4               as Field4,
      field_5               as Field5,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.createdBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.createdAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Assa1.Field01 as Field01,
      _Assa1.Field02 as Field02,
      _Assa1.Field03 as Field03,
      _Assa1.Field04 as Field04,
      _Assa1.Field05 as Field05,
      
      _Child1,
      _Child2,
      _Child3,
      _Assa1
      
}
