connection: "demo"
include: "/views/*.view"

datagroup: chi_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: chi_demo_default_datagroup_2 {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

# case_sensitive: no

# access_grant: can_view_financial_data {
#   user_attribute: department
#   allowed_values: [ "finance", "executive" ]
# }

named_value_format: usd_in_millions {
  value_format: "$0.000,,\" M\""
}

named_value_format: euro_in_thousands {
  value_format: "\"€\"0.000,\" K\""
  strict_value_format: yes
}

named_value_format: phone_number {
  value_format: "(###) ###-####"
}

fiscal_month_offset: 2
week_start_day: friday

persist_with: chi_demo_default_datagroup

explore: conversation_events {
  persist_with: chi_demo_default_datagroup
  # access_filter: {
  #   field: conversation_events.event
  #   user_attribute: sales
  # }

  # always_filter: {
  #   filters: [conversations.message_count: ">100"]
  # }

  # always_join: [entities]

  group_label: "Group label demo"
  label: "conversation_events label"

  join: conversations {
    type: left_outer
    sql_on: ${conversation_events.conversation_id} = ${conversations.conversation_id};;
    relationship: many_to_one
  }
  join: entities {
    type: left_outer
    sql_on: ${conversation_events.actor_entity_id} = ${conversation_events.actor_entity_id};;
     relationship: many_to_one
}

  # group_label: "Group label demo"
# sql_always_where: ${event} != 'ARCHIVE' ;;
}

explore: messages {
  persist_with: chi_demo_default_datagroup_2
   group_label: "Group label demo"
  label: "Messages label"

  # persist_with: chi_demo_default_datagroup
  # required_access_grants: [can_view_financial_data]
}

view: myview {}
