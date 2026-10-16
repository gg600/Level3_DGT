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
		Used under the MIT License.",
		
		"quick_tips": "Quick Tips",
		"sprint_tip": "Hold SHIFT to sprint and move faster.",
		"interact_tip": "Press E near an information point to learn about that location.",
		"start_exploring": "Got It — Start Exploring",
		
		"explorer_title": "JPC Explorer",
		"explorer_description": "Explore JPC and discover important locations around the school.",
		"location_astro_courts": "Astro Courts",
		"location_canteen": "Canteen",
		"location_chapel": "Chapel",
		"location_cooking_room": "Cooking Room",
		"location_gymnasium": "Gymnasium",
		"location_library": "Library",
		"location_music_suite": "Music Suite",
		"location_sports_fields": "Sports Fields",
		"location_student_reception": "Student Reception",
		"location_whare_haoini_paora": "Whare Haoini Paora",
		
		"location_discovered": "LOCATION DISCOVERED!",
		"locations_discovered": "Locations Discovered",
		
		"win_title": "Congratulations!",
		"win_message": "You've discovered all 10 locations around John Paul College!",
		"continue_exploring": "Continue Exploring",
		"return_to_main_menu": "Return to Main Menu",
		
		"music": "Music",
		"sound_effects": "Sound Effects",
		
		
		
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
		MITライセンスのもとで使用しています。",
		
		"quick_tips": "クイックヒント",
		"sprint_tip": "Shiftキーを押し続けると、ダッシュして速く移動できます。",
		"interact_tip": "案内ポイントの近くでEキーを押すと、その場所について学べます。",
		"start_exploring": "わかりました — 探索を始める",

		"explorer_title": "JPC Explorer",
		"explorer_description": "JPCを探索して、大切な場所を見つけよう。",
		"location_astro_courts": "アストロコート",
		"location_canteen": "売店",
		"location_chapel": "チャペル",
		"location_cooking_room": "調理室",
		"location_gymnasium": "体育館",
		"location_library": "図書館",
		"location_music_suite": "音楽室",
		"location_sports_fields": "運動場",
		"location_student_reception": "生徒受付",
		"location_whare_haoini_paora": "ファレ・ハオイニ・パオラ",

		"location_discovered": "場所を発見！",
		"locations_discovered": "発見した場所",
		
		"win_title": "おめでとう！",
		"win_message": "JPCの10か所すべてを発見しました！",
		"continue_exploring": "探索を続ける",
		"return_to_main_menu": "メインメニューに戻る",
		
		"music": "音楽",
		"sound_effects": "効果音",

	}
}



func set_language(language: String):
	if current_language == language:
		return

	current_language = language
	language_changed.emit()
	
func get_text(key: String) -> String:
	return translations[current_language].get(key, key)
