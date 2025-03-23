return {
  "duckdm/neowarrior.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    colors = {
      neowarrior = { group = "NeoWarrior", fg = "#3eeafa", bg = "black" },
      neowarrior_inverted = { group = "NeoWarriorInverted", fg = "black", bg = "#3cc8d7" },
      default = { group = "", fg = nil, bg = nil },
      dim = { group = "NeoWarriorTextDim", fg = "#acb2be", bg = nil },
      danger = { group = "NeoWarriorTextDanger", fg = "#cc0000", bg = nil },
      warning = { group = "NeoWarriorTextWarning", fg = "#ccaa00", bg = nil },
      success = { group = "NeoWarriorTextSuccess", fg = "#00cc00", bg = nil },
      info = { group = "NeoWarriorTextInfo", fg = "#00aaff", bg = nil },
      danger_bg = { group = "NeoWarriorTextDangerBg", fg = "#ffffff", bg = "#cc0000" },
      info_bg = { group = "NeoWarriorTextInfoBg", fg = "#000000", bg = "#00aaff" },
      project = { group = "NeoWarriorGroup", fg = "#00aaff", bg = nil },
      annotation = { group = "NeoWarriorAnnotation", fg = "#00aaff", bg = nil },
      tag = { group = "NeoWarriorTag", fg = "#ffffff", bg = "#333333" },
      current_date = { group = "NeoWarriorCurrentDate", fg = "#000000", bg = "#00aaff" },
      marked_date = { group = "NeoWarriorMarkedDate", fg = "#ffffff", bg = "#00aa66" },
    },
  },
}
