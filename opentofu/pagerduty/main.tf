data "pagerduty_user" "admin" {
  email = "admin@theops.dev"
}

resource "pagerduty_team" "theopsdev" {
  name        = "theopsdev"
  description = "TheOpsDev Engineering"
}

resource "pagerduty_team_membership" "theopsdev" {
  user_id = data.pagerduty_user.admin.id
  team_id = pagerduty_team.theopsdev.id
}