(define (domain mystery_blocksworld_49)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (harmony)
    (pain ?x)
    (craves ?x ?y)
  )

  (:action attack
    :parameters (?x)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
    )
  )

  (:action succumb
    :parameters (?x)
    :precondition (pain ?x)
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?x ?y)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (not (province ?y))
      (not (pain ?x))
      (harmony)
      (province ?x)
      (craves ?x ?y)
    )
  )

  (:action feast
    :parameters (?x ?y)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (pain ?x)
      (province ?y)
    )
  )
)