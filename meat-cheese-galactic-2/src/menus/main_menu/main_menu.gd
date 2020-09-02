extends Control


func _ready():
	Events.connect("chat_messaged", self, "_on_chat_messaged")


func _on_chat_messaged(message):
	if $Chat.get_line_count() > 128:
		$Chat.hide()
		$Chat.remove_line(0)
		$Chat.show()
	$Chat.append_bbcode(message + "\n")


func _on_ChatInput_text_entered(text):
	$ChatInput.clear()
	Chat.say(text)
