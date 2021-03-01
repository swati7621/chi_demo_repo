view: conversation_events {
  # required_access_grants: [can_view_financial_data]
  sql_table_name: "BICYCLE_HEALTH"."CONVERSATION_EVENTS"
    ;;

  dimension: _file {
    type: string
    sql: ${TABLE}."_FILE" ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
  }

  dimension: _line {
    type: number
    sql: ${TABLE}."_LINE" ;;
    value_format_name: usd
  }

  measure: line_measure_demo {
    type: count
     sql: ${_line} ;;
    # sql: ${TABLE}."_LINE" ;;
  }

  dimension: actor_demo {
    type: string
  }

  dimension: line_tier {
    type: tier
    tiers: [100,1000,10000,100000]
    style: classic
  }

  dimension: _modified {
    type: string
    sql: ${TABLE}."_MODIFIED" ;;
  }

  dimension: actor_entity_id {
    group_label: "ID"
    type: string
    sql: ${TABLE}."ACTOR_ENTITY_ID" ;;
  }

  dimension: conversation_id {
    primary_key: yes
    group_label: "ID"
    # required_access_grants: [can_view_financial_data]
    type: string
    # hidden: yes
    sql: ${TABLE}."CONVERSATION_ID" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension: event_data {
    type: string
    hidden: yes
    sql: concat(${event},${data}) ;;
  }

  dimension: event_is_archive {
    type: yesno
    sql: ${event} = 'ARCHIVE' ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  measure: count {
    label: "Convo_Id"
    description: "count of convo_id"
    type: count
    drill_fields: [conversations.conversation_id,data]
  }

  measure: sum_ {
    type: average
    sql: case when ${event} = 'ARCHIVE' then 1 end ;;
  }
}
