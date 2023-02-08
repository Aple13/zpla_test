@EndUserText.label: 'Consumption CDS for Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity zpla_c_root
  as projection on zpla_i_root
{
  key RootUuid,
  @Search.defaultSearchElement: true
      Field1,
      Field2,
      Field3,
      Field4,
      Field5,
      _Assa1.Field01 as Field01,
      _Assa1.Field02 as Field02,
      _Assa1.Field03 as Field03,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Child1 : redirected to composition child zpla_c_child1,
      _Child2 : redirected to composition child zpla_c_child2,
      _Child3 : redirected to composition child zpla_c_child3,
      _Assa1
}
