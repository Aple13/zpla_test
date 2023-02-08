@EndUserText.label: 'Consumption CDS for Child1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity zpla_c_child1
  as projection on zpla_i_child1
{
  key Child1Uuid,
      RootUuid,
      Field1,
      Field2,
      Field3,
      Field4,
      Field5,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Root : redirected to parent zpla_c_root
}
