include: "arch_outcomes_admin.view.lkml"

view: arch_outcomes {
  extends: [arch_outcomes_admin]

  dimension: outcome_tracker_id { hidden: yes }

  measure: outcome_score { hidden: yes }
}
