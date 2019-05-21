connection: "bc360_main"

include: "//bc360_admin/bc360_triggers"

include: "*.view.lkml"

label: "BC360 - Admin"

explore: arch_outcomes_admin {
  label: "Outcome Architecture [ADMIN]"
}
