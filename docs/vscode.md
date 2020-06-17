# Visual Stdio Code Setup

## Select next suggestion by **Ctrl+Space**

### Purpose
- Change keybindings for selecting next suggestion by **Ctrl+Space**.
- Change keybindings for selecting previous suggestion by **Ctrl+Shift+Space**.

### Disable Conflicting Keybindings
- Add following script to `keybindings.json`.

```
[
	{
		"key": "ctrl+space",
		"command": "-toggleSuggestionDetails",
		"when": "editorTextFocus && suggestWidgetVisible"
	}
]
```

### Add Keybinding for Next Suggestion
- Add following script to `keybindings.json`.

```
[
	{
		"key": "ctrl+space",
		"command": "selectNextSuggestion",
		"when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
	}
]
```

### Add Keybinding for Previous Suggestion
- Add following script to `keybindings.json`.
```
[
	{
		"key": "ctrl+shift+space",
		"command": "selectPrevSuggestion",
		"when": "editorTextFocus && suggestWidgetMultipleSuggestions && suggestWidgetVisible"
	}
]
```

### Reference
- [Qitta](https://qiita.com/carnelia0702/items/fc736cfc61daa282f789)