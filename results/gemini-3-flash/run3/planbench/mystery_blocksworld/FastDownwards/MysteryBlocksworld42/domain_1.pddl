(define (domain mystery_blocksworld_42)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
  )

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

  (:action overcome
    :parameters (?obj - obj ?other - obj)
    :precondition (and (pain ?obj) (province ?other))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
    )
  )

  (:action feast
    :parameters (?obj - obj ?other - obj)
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