(define (domain mystery_blocksworld_31)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (pain ?x)
    (craves ?x ?y)
    (harmony)
  )

  (:action attack
    :parameters (?obj)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
      (pain ?obj)
    )
  )

  (:action succumb
    :parameters (?obj)
    :precondition (pain ?obj)
    :effect (and
      (not (pain ?obj))
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?obj ?other)
    :precondition (and (pain ?obj) (province ?other))
    :effect (and
      (not (pain ?obj))
      (not (province ?other))
      (province ?obj)
      (craves ?obj ?other)
      (harmony)
    )
  )

  (:action feast
    :parameters (?obj ?other)
    :precondition (and (province ?obj) (craves ?obj ?other) (harmony))
    :effect (and
      (not (province ?obj))
      (not (craves ?obj ?other))
      (not (harmony))
      (pain ?obj)
      (province ?other)
    )
  )
)