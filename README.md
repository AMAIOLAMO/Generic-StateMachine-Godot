# Generic State Machine

## how to use
> the logic behind a single state machine is pretty simple, when you request a state change, the state machine would simply call the `state_changed(oldState, newState)` signal

Here's an example on how to use it:
- first create a state data, I would be using enum in this case

```gdscript
enum MoveState {
    IDLE, MOVE
}
```

- next inherit the base class of my state machine, then you have the power of the state machine in your hands now!

```gdscript
class_name MyStateMachine extends StateMachine

func _ready() -> void:
    set_state(MoveState.IDLE) # setting the initial state as IDLE

func _process(delta: float) -> void:
    var input = movementScript.get_input()

    _movement_check(input)

func _movement_check() -> void:
    # check if the given input is (0, 0) [which means player not moving]
    # else set to move state
    if input.is_equal_approx(Vector2.ZERO):
        set_state(MoveState.IDLE)
    else:
        set_state(MoveState.MOVE)

```

- in your other scripts, you could then, listen to the state machine to do the actions!

```gdscript
class_name MyAnimationController extends AnimationPlayer

func _ready() -> void:
    # listen / connect to your custom state machine's state changed signal
    $MyStateMachine.connect("state_changed", self, "_state_changed_handler")

func _state_changed_handler(old, new) -> void:
    # play respective animations to the given new state!
    match(new):
        MoveState.IDLE:
            self.play("Idle")
        MoveState.MOVE:
            self.play("Move")
```

### have fun using my super basic generic state machine!

---

licensed in MIT, by CXRedix