view: arch_outcomes_admin {
  # sql_table_name: bc360_arch_marketing.arch_outcomes ;;

  derived_table: {
    datagroup_trigger: dg_bc360_outcomes

    sql:  SELECT
            CAST(outcome_tracker_id AS INT64) outcome_tracker_id,
            outcome_intent,
            outcome_mechanism,
            outcome_quality,
            outcome_score,
            outcome_type,
            outcome_type_name,
            outcome_type_category,
         FROM arch_outcomes.arch_outcomes ao;;
  }

##########  METADATA  ##########

  dimension: outcome_tracker_id {
    view_label: "Z - Metadata"
    group_label: "Database IDs"
    label: "Outcome Tracker ID [Arch_Outcomes]"

    primary_key: yes
    type: string
    hidden: no

    sql: ${TABLE}.outcome_tracker_id ;;
  }


  ##########  DIMENSIONS  ##########

  dimension: outcome_intent {
    view_label: "6. Outcomes"
    label: "Patient Intent"
    description: "'Appt Requests' | 'Classes' | 'Events' | 'Classes' | 'Seminars', etc. [MAPPED]"

    type: string
    sql: ${TABLE}.outcome_intent ;;
  }

  dimension: outcome_mechanism {
    view_label: "6. Outcomes"
    label: "Outcome Mechanism"
    description: "'Calls' | 'Form Fills' | 'HRAs', etc. [MAPPED]"

    type: string
    sql: ${TABLE}.outcome_mechanism ;;
  }

  dimension: outcome_quality {
    view_label: "6. Outcomes"
    label: "Outcome Quality"
    description: "'Referrals' | 'Leads' | 'Outcomes' [MAPPED]"

    type: string
    case: {
      when: {
        sql: ${TABLE}.outcome_quality = 'Referrals' ;;
        label: "Referrals"
      }
      when: {
        sql: ${TABLE}.outcome_quality = 'Leads' ;;
        label: "Leads"
      }
      else: "Outcomes"
    }

  }

  dimension: outcome_score {
    view_label: "6. Outcomes"
    label: "Outcome Score"
    description: "Score from 1-5 (NOT USED)"
    hidden: yes

    type: number
    sql: ${TABLE}.outcome_score ;;
  }

  dimension: outcome_type_category {
    view_label: "6. Outcomes"
    label: "Outcome Category"

    type: string
    sql:  ${TABLE}.outcome_type_category;;

  }

  dimension: outcome_type {
    view_label: "6. Outcomes"
    label: "Outcome"
    description: "Detailed outcome labels [MAPPED]"

    type: string
    sql: ${TABLE}.outcome_type ;;
  }

  dimension: outcome_type_name {
    view_label: "6. Outcomes"
    label: "Outcome Type (ORIGINAL)"
    description: "Original 'conversion_type_name' [PASS-THRU from Google Ads]"

    hidden: no
    type: string
    sql: ${TABLE}.outcome_type_name ;;
  }
}
