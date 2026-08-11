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

		Your goal is to explore the John Paul College campus and learn where important locations are.

		Controls:
		• W, A, S, D – Move
		• Mouse – Look around
		• Space – Jump
		• Shift – Sprint
		• E – Interact with information points
		• Esc – Pause the game

		Walk around the school and interact with information points to learn about each location.
		Use what you discover to become familiar with the campus.

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

		学校内を探索し、ジョン・ポール・カレッジの重要な場所について学びましょう。

		操作方法：
		• W、A、S、Dキー – 移動
		• マウス – 視点を動かす
		• スペースキー – ジャンプ
		• Shiftキー – ダッシュ
		• Eキー – 情報ポイントを調べる
		• Escキー – ポーズメニューを開く

		学校内を歩き回り、情報ポイントを調べて各施設について学びましょう。
		キャンパスに慣れるために、さまざまな場所を探索してください。

		楽しく探索しましょう！",
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
