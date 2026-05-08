(define (domain mystery_blocksworld_27)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)     ;; equivalent to clear(x)
    (planet ?x - obj)       ;; equivalent to on_table(x)
    (harmony)               ;; equivalent to hand_empty
    (pain ?x - obj)         ;; equivalent to holding(x)
    (craves ?x ?y - obj)    ;; equivalent to on(x, y)
  )

  ;; attack is equivalent to the pick-up action from the table
  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; succumb is equivalent to the put-down action on the table
  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; overcome is equivalent to the stack action
  (:action overcome
    :parameters (?x ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (pain ?x))
      (not (province ?y))
    )
  )

  ;; feast is equivalent to the unstack action
  (:action feast
    :parameters (?x ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)