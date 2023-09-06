resource "azurerm_databricks_workspace" "myworkspace" {
  name                = "databricks-test"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
  
}

data "databricks_node_type" "smallest" {
  depends_on = [ azurerm_databricks_workspace.myworkspace ]
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  depends_on = [ azurerm_databricks_workspace.myworkspace ]
  long_term_support = true
}

resource "databricks_cluster" "team_cluster" {
  cluster_name            = "${var.department}-${var.cluster_name}"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20

  autoscale {
    min_workers = 1
    max_workers = 3
  }

   spark_conf = {
    "spark.databricks.io.cache.enabled" : true,
    "spark.databricks.io.cache.maxDiskUsage" : "50g",
    "spark.databricks.io.cache.maxMetaDataCache" : "1g"
  }
}

# resource "databricks_permissions" "can_manage_team_cluster" {
#   cluster_id = databricks_cluster.team_cluster.id
#   access_control {
#     group_name       = databricks_group.data-science.display_name
#     permission_level = "CAN_MANAGE"
#   }
# }