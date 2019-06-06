package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/shared_preferences"

)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(800, 1280),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
		VendorName:      "atresnjo",
		ApplicationName: "clippr",
	}),
}
