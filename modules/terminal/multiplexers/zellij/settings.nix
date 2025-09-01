_: {
  programs.zellij.settings = {
    keybinds = {
      clear-defaults = true;

      locked = {
        bind = {
          "Ctrl g" = {SwitchToMode = "normal";};
        };
      };

      pane = {
        bind = {
          left = {MoveFocus = "left";};
          down = {MoveFocus = "down";};
          up = {MoveFocus = "up";};
          right = {MoveFocus = "right";};
          c = {
            SwitchToMode = "renamepane";
            PaneNameInput = 0;
          };
          d = {
            NewPane = "down";
            SwitchToMode = "locked";
          };
          e = {
            TogglePaneEmbedOrFloating = {};
            SwitchToMode = "locked";
          };
          f = {
            ToggleFocusFullscreen = {};
            SwitchToMode = "locked";
          };
          h = {MoveFocus = "left";};
          i = {
            TogglePanePinned = {};
            SwitchToMode = "locked";
          };
          j = {MoveFocus = "down";};
          k = {MoveFocus = "up";};
          l = {MoveFocus = "right";};
          n = {
            NewPane = {};
            SwitchToMode = "locked";
          };
          p = {SwitchToMode = "normal";};
          r = {
            NewPane = "right";
            SwitchToMode = "locked";
          };
          s = {
            NewPane = "stacked";
            SwitchToMode = "locked";
          };
          w = {
            ToggleFloatingPanes = {};
            SwitchToMode = "locked";
          };
          x = {
            CloseFocus = {};
            SwitchToMode = "locked";
          };
          z = {
            TogglePaneFrames = {};
            SwitchToMode = "locked";
          };
          tab = {SwitchFocus = {};};
        };
      };

      tab = {
        bind = {
          left = {GoToPreviousTab = {};};
          down = {GoToNextTab = {};};
          up = {GoToPreviousTab = {};};
          right = {GoToNextTab = {};};
          "1" = {
            GoToTab = 1;
            SwitchToMode = "locked";
          };
          "2" = {
            GoToTab = 2;
            SwitchToMode = "locked";
          };
          "3" = {
            GoToTab = 3;
            SwitchToMode = "locked";
          };
          "4" = {
            GoToTab = 4;
            SwitchToMode = "locked";
          };
          "5" = {
            GoToTab = 5;
            SwitchToMode = "locked";
          };
          "6" = {
            GoToTab = 6;
            SwitchToMode = "locked";
          };
          "7" = {
            GoToTab = 7;
            SwitchToMode = "locked";
          };
          "8" = {
            GoToTab = 8;
            SwitchToMode = "locked";
          };
          "9" = {
            GoToTab = 9;
            SwitchToMode = "locked";
          };
          "[" = {
            BreakPaneLeft = {};
            SwitchToMode = "locked";
          };
          "]" = {
            BreakPaneRight = {};
            SwitchToMode = "locked";
          };
          b = {
            BreakPane = {};
            SwitchToMode = "locked";
          };
          h = {GoToPreviousTab = {};};
          j = {GoToNextTab = {};};
          k = {GoToPreviousTab = {};};
          l = {GoToNextTab = {};};
          n = {
            NewTab = {};
            SwitchToMode = "locked";
          };
          r = {
            SwitchToMode = "renametab";
            TabNameInput = 0;
          };
          s = {
            ToggleActiveSyncTab = {};
            SwitchToMode = "locked";
          };
          t = {SwitchToMode = "normal";};
          x = {
            CloseTab = {};
            SwitchToMode = "locked";
          };
          tab = {ToggleTab = {};};
        };
      };

      resize = {
        bind = {
          left = {Resize = "Increase left";};
          down = {Resize = "Increase down";};
          up = {Resize = "Increase up";};
          right = {Resize = "Increase right";};
          "+" = {Resize = "Increase";};
          "-" = {Resize = "Decrease";};
          "=" = {Resize = "Increase";};
          H = {Resize = "Decrease left";};
          J = {Resize = "Decrease down";};
          K = {Resize = "Decrease up";};
          L = {Resize = "Decrease right";};
          h = {Resize = "Increase left";};
          j = {Resize = "Increase down";};
          k = {Resize = "Increase up";};
          l = {Resize = "Increase right";};
          r = {SwitchToMode = "normal";};
        };
      };

      move = {
        bind = {
          left = {MovePane = "left";};
          down = {MovePane = "down";};
          up = {MovePane = "up";};
          right = {MovePane = "right";};
          h = {MovePane = "left";};
          j = {MovePane = "down";};
          k = {MovePane = "up";};
          l = {MovePane = "right";};
          m = {SwitchToMode = "normal";};
          n = {MovePane = {};};
          p = {MovePaneBackwards = {};};
          tab = {MovePane = {};};
        };
      };

      scroll = {
        bind = {
          "Alt left" = {
            MoveFocusOrTab = "left";
            SwitchToMode = "locked";
          };
          "Alt down" = {
            MoveFocus = "down";
            SwitchToMode = "locked";
          };
          "Alt up" = {
            MoveFocus = "up";
            SwitchToMode = "locked";
          };
          "Alt right" = {
            MoveFocusOrTab = "right";
            SwitchToMode = "locked";
          };
          e = {
            EditScrollback = {};
            SwitchToMode = "locked";
          };
          f = {
            SwitchToMode = "entersearch";
            SearchInput = 0;
          };
          "Alt h" = {
            MoveFocusOrTab = "left";
            SwitchToMode = "locked";
          };
          "Alt j" = {
            MoveFocus = "down";
            SwitchToMode = "locked";
          };
          "Alt k" = {
            MoveFocus = "up";
            SwitchToMode = "locked";
          };
          "Alt l" = {
            MoveFocusOrTab = "right";
            SwitchToMode = "locked";
          };
          s = {SwitchToMode = "normal";};
        };
      };

      search = {
        bind = {
          c = {SearchToggleOption = "CaseSensitivity";};
          n = {Search = "down";};
          o = {SearchToggleOption = "WholeWord";};
          p = {Search = "up";};
          w = {SearchToggleOption = "Wrap";};
        };
      };

      session = {
        bind = {
          a = {
            LaunchOrFocusPlugin = {
              _args = ["zellij:about"];
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
          c = {
            LaunchOrFocusPlugin = {
              _args = ["configuration"];
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
          d = {Detach = {};};
          o = {SwitchToMode = "normal";};
          p = {
            LaunchOrFocusPlugin = {
              _args = ["plugin-manager"];
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
          s = {
            LaunchOrFocusPlugin = {
              _args = ["zellij:share"];
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
          w = {
            LaunchOrFocusPlugin = {
              _args = ["session-manager"];
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
        };
      };

      shared_among = {
        "normal,locked" = {
          bind = {
            "Alt left" = {MoveFocusOrTab = "left";};
            "Alt down" = {MoveFocus = "down";};
            "Alt up" = {MoveFocus = "up";};
            "Alt right" = {MoveFocusOrTab = "right";};
            "Alt +" = {Resize = "Increase";};
            "Alt -" = {Resize = "Decrease";};
            "Alt =" = {Resize = "Increase";};
            "Alt [" = {PreviousSwapLayout = {};};
            "Alt ]" = {NextSwapLayout = {};};
            "Alt f" = {ToggleFloatingPanes = {};};
            "Alt h" = {MoveFocusOrTab = "left";};
            "Alt i" = {MoveTab = "left";};
            "Alt j" = {MoveFocus = "down";};
            "Alt k" = {MoveFocus = "up";};
            "Alt l" = {MoveFocusOrTab = "right";};
            "Alt n" = {NewPane = {};};
            "Alt o" = {MoveTab = "right";};
            "Alt p" = {TogglePaneInGroup = {};};
            "Alt Shift p" = {ToggleGroupMarking = {};};
          };
        };
      };

      shared_except = {
        "locked,renametab,renamepane" = {
          bind = {
            "Ctrl g" = {SwitchToMode = "locked";};
            "Ctrl q" = {Quit = {};};
          };
        };
        "locked,entersearch" = {
          bind = {
            enter = {SwitchToMode = "locked";};
          };
        };
        "locked,entersearch,renametab,renamepane" = {
          bind = {
            esc = {SwitchToMode = "locked";};
          };
        };
        "locked,entersearch,renametab,renamepane,move" = {
          bind = {
            m = {SwitchToMode = "move";};
          };
        };
        "locked,entersearch,search,renametab,renamepane,session" = {
          bind = {
            o = {SwitchToMode = "session";};
          };
        };
        "locked,tab,entersearch,renametab,renamepane" = {
          bind = {
            t = {SwitchToMode = "tab";};
          };
        };
        "locked,resize,pane,tab,entersearch,renametab,renamepane" = {
          bind = {
            r = {SwitchToMode = "resize";};
          };
        };
      };

      "shared_among_extra" = {
        "normal,resize,tab,scroll,prompt,tmux" = {
          bind = {
            p = {SwitchToMode = "pane";};
          };
        };
        "normal,resize,search,move,prompt,tmux" = {
          bind = {
            s = {SwitchToMode = "scroll";};
          };
        };
        "scroll,search" = {
          bind = {
            PageDown = {PageScrollDown = {};};
            PageUp = {PageScrollUp = {};};
            left = {PageScrollUp = {};};
            down = {ScrollDown = {};};
            up = {ScrollUp = {};};
            right = {PageScrollDown = {};};
            "Ctrl b" = {PageScrollUp = {};};
            "Ctrl c" = {
              ScrollToBottom = {};
              SwitchToMode = "locked";
            };
            d = {HalfPageScrollDown = {};};
            "Ctrl f" = {PageScrollDown = {};};
            h = {PageScrollUp = {};};
            j = {ScrollDown = {};};
            k = {ScrollUp = {};};
            l = {PageScrollDown = {};};
            u = {HalfPageScrollUp = {};};
          };
        };
      };

      entersearch = {
        bind = {
          "Ctrl c" = {SwitchToMode = "scroll";};
          esc = {SwitchToMode = "scroll";};
          enter = {SwitchToMode = "search";};
        };
      };

      renametab = {
        bind = {
          esc = {
            UndoRenameTab = {};
            SwitchToMode = "tab";
          };
        };
      };

      "shared_among_rename" = {
        "renametab,renamepane" = {
          bind = {
            "Ctrl c" = {SwitchToMode = "locked";};
          };
        };
      };

      renamepane = {
        bind = {
          esc = {
            UndoRenamePane = {};
            SwitchToMode = "pane";
          };
        };
      };
    };

    plugins = {
      about = {
        location = "zellij:about";
      };
      compact-bar = {
        location = "zellij:compact-bar";
      };
      configuration = {
        location = "zellij:configuration";
      };
      filepicker = {
        location = "zellij:strider";
        cwd = "/";
      };
      plugin-manager = {
        location = "zellij:plugin-manager";
      };
      session-manager = {
        location = "zellij:session-manager";
      };
      status-bar = {
        location = "zellij:status-bar";
      };
      strider = {
        location = "zellij:strider";
      };
      tab-bar = {
        location = "zellij:tab-bar";
      };
      welcome-screen = {
        location = "zellij:session-manager";
        welcome_screen = true;
      };
    };

    load_plugins = {};

    web_client = {
      font = "monospace";
    };

    default_mode = "locked";
    show_startup_tips = false;
  };
}
