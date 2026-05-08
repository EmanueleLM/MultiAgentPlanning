(define (domain mystery_blocksworld)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (pain ?x)
    (craves ?x ?y)
    (harmony)
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
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (not (pain ?x))
      (not (province ?y))
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