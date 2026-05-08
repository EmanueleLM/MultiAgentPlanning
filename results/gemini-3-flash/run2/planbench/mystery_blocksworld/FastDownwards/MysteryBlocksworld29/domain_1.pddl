(define (domain mystery_blocksworld_29)
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
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - obj)
    :precondition (pain ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain ?o))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)