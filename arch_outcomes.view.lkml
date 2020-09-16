include: "/**/*.view.lkml"

view: arch_outcomes {
  extends: [arch_outcomes_admin]

  dimension: outcome_tracker_id { hidden: yes }
  dimension: outcome_score { hidden: yes }
}
