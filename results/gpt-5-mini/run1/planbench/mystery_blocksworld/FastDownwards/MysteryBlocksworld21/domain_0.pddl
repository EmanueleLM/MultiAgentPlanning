(define (domain craving-domain)
  (:requirements :strips)
  (:predicates
    (craves ?x ?y)
    (province ?x)
    (planet ?x)
    (pain ?x)
    (harmony)
  )

  (:action attack
    :parameters (?x)
    :precondition (and (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x ?y)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x ?y)
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