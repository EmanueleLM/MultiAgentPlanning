(define (domain multiagent_collect)
  (:requirements :strips)
  (:predicates
    (hand ?agent ?state)        ; hand agent state (e.g. empty or holding-<obj>)
    (cats ?loc)                 ; cats present at location
    (texture ?obj ?t)           ; object has texture t
    (vase ?obj)                 ; object is a vase
    (next ?s1 ?s2)              ; timeline pointer from slot s1 to slot s2
    (sneeze ?agent)             ; agent has sneezed
    (spring ?s)                 ; object is a spring
    (stupendous ?obj)           ; object is stupendous
    (collect ?agent ?obj)       ; agent has collected object
  )

  ;; Action schemas are namespaced by agent prefix so actions for different agents remain distinct.
  ;; 1) player2_press_spring: player2 primes/presses a spring to make a vase stupendous, and advances timeline.
  (:action player2_press_spring
    :parameters (?sp ?v ?s_from ?s_to ?s_next)
    :precondition (and
      (spring ?sp)
      (vase ?v)
      (hand player2 empty)
      (next ?s_from ?s_to)
    )
    :effect (and
      (stupendous ?v)
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )

  ;; 2) player1_collect: player1 collects a vase. Requires the vase to be stupendous (temporal / ordering constraint)
  ;;    and advances the timeline pointer.
  (:action player1_collect
    :parameters (?v ?s_from ?s_to ?s_next)
    :precondition (and
      (vase ?v)
      (hand player1 empty)
      (stupendous ?v)
      (next ?s_from ?s_to)
    )
    :effect (and
      (collect player1 ?v)
      (hand player1 holding-?v)
      (not (hand player1 empty))
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )

  ;; 3) player1_sneeze: player1 sneezes if cats are present. This records the sneeze; it does not itself change timeline.
  (:action player1_sneeze
    :parameters (?loc)
    :precondition (and
      (cats ?loc)
    )
    :effect (and
      (sneeze player1)
    )
  )

  ;; 4) player1_pet_cats: player1 pets the cats; keeps cats present but may be used in plans as a precondition for other actions.
  (:action player1_pet_cats
    :parameters (?loc)
    :precondition (and
      (cats ?loc)
      (hand player1 empty)
    )
    :effect (and
      ;; petting is an observable action in the model; no destructive effects on available resources
      ;; (we intentionally do not remove (cats ?loc) to avoid unsupported assumptions about removing cats)
      ;; provide a noop-like effect to allow planners to use this action when needed
      (cats ?loc)
    )
  )

  ;; 5) player2_inspect_texture: player2 inspects the vase texture (records texture) and does not consume timeline slot.
  (:action player2_inspect_texture
    :parameters (?v ?t)
    :precondition (and
      (vase ?v)
      (hand player2 empty)
    )
    :effect (and
      (texture ?v ?t)
    )
  )

  ;; 6) player2_collect: player2 may collect other items (e.g., the spring) if needed; advances timeline.
  (:action player2_collect
    :parameters (?obj ?s_from ?s_to ?s_next)
    :precondition (and
      (hand player2 empty)
      (next ?s_from ?s_to)
    )
    :effect (and
      (collect player2 ?obj)
      (hand player2 holding-?obj)
      (not (hand player2 empty))
      (not (next ?s_from ?s_to))
      (next ?s_to ?s_next)
    )
  )
)