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
		"instructions_info": "Welcome to JPC Explorer!

		Explore the JPC campus and discover important locations.

		Controls
		• WASD – Move
		• Mouse – Look
		• Space – Jump
		• Shift – Sprint
		• E – Interact
		• Tab – Explorer checklist
		• Esc – Pause

		Find locations and interact with information points to learn about the school.

		Enjoy exploring!",
		"options_info": "Adjust the volume of the game's background music.",
		"credits_info": "Third-Party Assets

		Sky3D (Dynamic Day/Night System)
		Created by TokisanGames
		Used under the MIT License."
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
		"instructions_info": "JPC Explorerへようこそ！

JPCのキャンパスを探索し、大切な場所を見つけましょう。

操作方法
• WASD – 移動
• マウス – 視点操作
• Space – ジャンプ
• Shift – ダッシュ
• E – 調べる
• Tab – 探索チェックリスト
• Esc – 一時停止

場所を見つけ、案内ポイントを調べて学校について学びましょう。

探索を楽しんでください！",
		"options_info": "ゲームのBGMの音量を調整します。",
		"credits_info": "サードパーティアセット

		Sky3D（昼夜サイクルシステム）
		制作者：TokisanGames
		MITライセンスのもとで使用しています。"
	}
}



func set_language(language: String):
	if current_language == language:
		return

	current_language = language
	language_changed.emit()
	
func get_text(key: String) -> String:
	return translations[current_language].get(key, key)
