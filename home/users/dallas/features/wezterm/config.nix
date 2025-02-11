{ ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require "wezterm"

    local config = wezterm.config_builder()

    -- config.front_end = "WebGpu"

    config.color_scheme = "Everforest Light (Gogh)"
    config.window_background_opacity = 0.95

    config.font = wezterm.font "Inconsolata Nerd Font Mono"
    config.font_size = 16

    config.hide_tab_bar_if_only_one_tab = true

    -- keybindings
    local act = wezterm.action
    config.keys = {
      { key = "w",          mods = "CMD",             action = act.CloseCurrentPane { confirm = true } },

       -- Pane keybindings
      { key = "s",    mods = "CMD|SHIFT",    action = act.SplitVertical { domain = "CurrentPaneDomain" } },
      { key = "v",    mods = "CMD|SHIFT",    action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
      { key = "h",    mods = "CMD|SHIFT",    action = act.ActivatePaneDirection("Left") },
      { key = "j",    mods = "CMD|SHIFT",    action = act.ActivatePaneDirection("Down") },
      { key = "k",    mods = "CMD|SHIFT",    action = act.ActivatePaneDirection("Up") },
      { key = "l",    mods = "CMD|SHIFT",    action = act.ActivatePaneDirection("Right") },
      { key = "z",    mods = "CMD|SHIFT",    action = act.TogglePaneZoomState },
      { key = "o",    mods = "CMD|SHIFT",    action = act.RotatePanes "Clockwise" },
      { key = "r",    mods = "CMD|SHIFT",    action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
    }

    config.key_tables = {
      resize_pane = {
        { key = "h",         action = act.AdjustPaneSize { "Left", 1 } },
        { key = "j",         action = act.AdjustPaneSize { "Down", 1 } },
        { key = "k",         action = act.AdjustPaneSize { "Up", 1 } },
        { key = "l",         action = act.AdjustPaneSize { "Right", 1 } },
        { key = "Escape",    action = "PopKeyTable" },
        { key = "Enter",     action = "PopKeyTable" },
      }
    }

    return config
  '';
}
