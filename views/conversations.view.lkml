view: conversations {
  sql_table_name: "BICYCLE_HEALTH"."CONVERSATIONS"
    ;;
  drill_fields: [conversation_id]

  dimension: conversation_id {
    # required_access_grants: [can_view_financial_data]
    primary_key: yes
    type: string
    sql: ${TABLE}."CONVERSATION_ID" ;;
  }

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
  }

  dimension: _modified {
    type: string
    sql: ${TABLE}."_MODIFIED" ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}."ARCHIVED" ;;
  }

  dimension: assigned_entity_id {
    type: string
    sql: ${TABLE}."ASSIGNED_ENTITY_ID" ;;
  }

  dimension: created_timestamp {
    type: string
    sql: ${TABLE}."CREATED_TIMESTAMP" ;;
  }

  dimension: last_message_timestamp {
    type: string
    sql: ${TABLE}."LAST_MESSAGE_TIMESTAMP" ;;
  }

  dimension: message_count {
    type: number
    sql: ${TABLE}."MESSAGE_COUNT" ;;
  }

  dimension: primary_entity_id {
    type: string
    sql: ${TABLE}."PRIMARY_ENTITY_ID" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [conversation_id, conversation_events.count, messages.count]
  }
}
