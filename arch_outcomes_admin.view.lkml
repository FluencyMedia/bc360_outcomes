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
           outcome_type_name
         FROM arch_outcomes.arch_outcomes_base ao;;
  }

##########  METADATA  ##########

  dimension: outcome_tracker_id {
    view_label: "Z - Metadata"
    group_label: "Database IDs"
    label: "Outcome Tracker ID [Arch_Outcomes]"

    primary_key: yes
    type: string
    hidden: yes

    sql: ${TABLE}.outcome_tracker_id ;;
  }


  ##########  DIMENSIONS  ##########

  dimension: outcome_intent {
    view_label: "6. Outcomes"
    label: "Outcome Intent"
    description: "'Appt Requests' | 'Classes' | 'Events' | 'Classes' | 'Seminars', etc."

    type: string
    sql: ${TABLE}.outcome_intent ;;
  }

  dimension: outcome_mechanism {
    view_label: "6. Outcomes"
    label: "Outcome Mechanism"
    description: "'Calls' | 'Form Fills' | 'HRAs', etc."

    type: string
    sql: ${TABLE}.outcome_mechanism ;;
  }

  dimension: outcome_quality {
    view_label: "6. Outcomes"
    label: "Outcome Quality"
    description: "'Referrals' | 'Leads' | 'Outcomes'"

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

    type: number
    sql: ${TABLE}.outcome_score ;;
  }

  dimension: outcome_type_category {
    view_label: "6. Outcomes"
    label: "Outcome Type - Category"
    description: "Custom layer that groups more 'Outcome Types'"

    type: string

    case: {
      when: {
        sql: ${outcome_type} LIKE 'LP Calls%' ;;
        label: "LP Calls"
      }
      when: {
        sql: ${outcome_type} LIKE 'Ad%' ;;
        label: "Ad Calls"
      }
      when: {
        sql: ${outcome_type} LIKE '%Website Calls%' ;;
        label: "Website Calls"
      }
      when: {
        sql: ${outcome_type} LIKE 'LP Form - Seminars%' ;;
        label: "Tours"
      }
      when: {
        sql: ${outcome_type} LIKE 'LP Form%' ;;
        label: "LP Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%Form - Website%' ;;
        label: "Website Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%Action - Website%' ;;
        label: "FAD Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%FAD%' ;;
        label: "FAD Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%Process Step%Appt Request%' ;;
        label: "FAD Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%MyChart%' ;;
        label: "MyChart Forms"
      }
      when: {
        sql: ${outcome_type} LIKE '%HRA%' ;;
        label: "HRA Completions"
      }
      else: "Uncategorized Referral Type"
    }
  }

  dimension: outcome_type {
    view_label: "6. Outcomes"
    label: "Outcome Type"
    description: "Detailed custom categories from mapping spreadsheet"

    type: string
    sql: ${TABLE}.outcome_type ;;
  }

  dimension: outcome_type_name {
    view_label: "6. Outcomes"
    label: "Outcome Type Name"
    description: "Label that comes in direct from Google Ads"

    type: string
    sql: ${TABLE}.outcome_type_name ;;
  }
}
