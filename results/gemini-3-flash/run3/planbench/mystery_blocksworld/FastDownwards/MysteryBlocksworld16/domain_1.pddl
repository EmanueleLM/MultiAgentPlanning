(define (domain mystery_blocksworld_16)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (harmony)
    (pain ?x)
    (craves ?x ?y)
  )

  (:action attack
    :parameters (?obj)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj)
    :precondition (pain ?obj)
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj ?other)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
    )
  )

  (:action feast
    :parameters (?obj ?other)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (province ?other)
      (not (craves ?obj ?other))
      (not (province ?obj))
      (not (harmony))
    )
  )
)