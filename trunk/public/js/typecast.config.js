/*
Typecast 1.4 (release)
by Ara Pehlivanian (http://arapehlivanian.com)

This work is licensed under a Creative Commons Licence
http://creativecommons.org/licenses/by-nd/2.5/
*/

Typecast.Config = {
	Settings: {
		Mask: {
			FieldDataSeparator: ",",
			MaskCharacters: {
				Numeric: "#",
				Alpha: "A"
			},
			AllowInsert: true,
			DisplayMaskCharacters: false //Display mask characters when default text is not present
		},

		Suggest : {
			OutputAreaID : "SuggestOutputArea",
			isCaseSensitive : false,
			MatchFromStart : false,
			ResultLimit : 15,
			BrowserAutoComplete : false,
			IEForceRelative : true
		}
	},

	Data : {
		Mask : {
			Masks : {
				//rut : "##.###.###-#"
			}
		}
	}
}