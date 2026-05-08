(define (domain mystery_blocksworld_16)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (province ?b - block)
    (planet ?b - block)
    (pain ?b - block)
    (harmony)
    (craves ?b1 ?b2 - block)
  )

  (:action attack
    :parameters (?obj - block)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj - block)
    :precondition (pain ?obj)
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj ?other - block)
    :precondition (and (pain ?obj) (province ?other))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (pain ?obj))
      (not (province ?other))
    )
  )

  (:action feast
    :parameters (?obj ?other - block)
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