extends Control

@onready var line_edit: LineEdit = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/LineEdit
@onready var say_hi: Button = $ColorRect/MarginContainer/VBoxContainer/HBoxContainer/Button
@onready var show_hello: Label = $ColorRect/MarginContainer/VBoxContainer/Label

@export var private_key: String = ""

func _on_button_pressed() -> void:
    var your_name = line_edit.text.strip_edges()
    print("the input name is: %s" % [your_name])
    if your_name.length() > 0:
        if private_key.length() > 0:
            HelloOptimism.send_hello(your_name, private_key)
            var send_hello_result = HelloOptimism.whoami()
            show_hello.text = send_hello_result[0]
        else:
            show_hello.text = "Please set privatekey first"
    else:
        var call_hello_result = HelloOptimism.callHello()
        print("call hello result: %s" % [call_hello_result])
        if call_hello_result.size() > 0:
            show_hello.text = call_hello_result[0]
        else:
            show_hello.text = "Something went wrong, please check console"
