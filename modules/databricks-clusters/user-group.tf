resource "databricks_group" "data-science" {
    display_name = var.group_name
  
}

resource "databricks_user" "duser" {
  for_each  = toset(var.user_names)
  user_name = each.value
}

resource "databricks_group_member" "data-science-member" {
  for_each  = toset(var.user_names)
  group_id  = databricks_group.data-science.id
  member_id = databricks_user.duser[each.value].id
}