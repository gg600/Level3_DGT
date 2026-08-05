extends Node

signal language_changed

var current_language := "en"
var translations = {
	"en": {
		"game_title": "NAME OF THE GAME",
		"new_game": "New Game",
		"instructions": "Instructions",
		"options": "Options",
		"language": "Language",
		"quit": "Quit",
		"credits": "Credits",
		"back_to_menu": "Back to Menu",
		"quit_confirmation": "Are you sure you want to quit?",
		"sound_options": "Sound / Options",
		"pick_language": "Pick one language",
		"cancel": "Cancel",
		"quit_game": "Quit Game",
		"pause": "Pause",
		"pause_description": "Resume the game, change options, or return to the main menu.",
		"resume": "Resume",
		"main_menu": "Main Menu",
		"return_to_pause": "Return to Pause",
		"return": "Return",
		"instructions_info": "needs to be added",
		"options_info": "needs to be added",
		"credits_info": "need to be added"

	},

	"ja": {
		"game_title": "ゲームタイトル",
		"new_game": "新しいゲーム",
		"instructions": "遊び方",
		"options": "オプション",
		"language": "言語",
		"quit": "終了",
		"credits": "クレジット",
		"back_to_menu": "メニューに戻る",
		"quit_confirmation": "本当に終了しますか？",
		"sound_options": "サウンド・オプション",
		"pick_language": "言語を選択してください",
		"cancel": "キャンセル",
		"quit_game": "ゲームを終了",
		"pause": "一時停止",
		"pause_description": "ゲームを再開したり、設定を変更したり、メインメニューへ戻ることができます。",
		"resume": "再開",
		"main_menu": "メインメニュー",
		"return_to_pause": "一時停止画面へ戻る",
		"return": "戻る",
		"instructions_info": "needs to be added",
		"options_info": "needs to be added",
		"credits_info": "need to be added"
	}
}



func set_language(language: String):
	if current_language == language:
		return

	current_language = language
	language_changed.emit()
	
func get_text(key: String) -> String:
	return translations[current_language].get(key, key)
