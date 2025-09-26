extends Button

func dit_allo(message : String) -> void:
    print("Allo, ", message)

func dit_bye(message : String) -> void:
    print("Bye, ", message)

func _ready() -> void:
    var double_it := func(x: float) -> float: return 2.0 * x
    print(double_it.call(6.0))
    double_it = func(x: float) -> float: return 3.0 * x
    print(double_it.call(6))

    dit_allo("Poulet")
    var f : Callable = dit_allo
    f.call("Fred")
    f = dit_bye
    f.call("Poulet Fred")

    pressed.connect(func() -> void: print("Blah!"))

