(define (domain mystery_blocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
  )
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?o1 ?o2 - obj)
  )

  (:action attack
    :parameters (?o - obj)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (pain ?o)
    )
  )

  (:action succumb
    :parameters (?o - obj)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (not (pain ?o))
      (province ?o)
      (planet ?o)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?o1 - obj ?o2 - obj)
    :precondition (and
      (province ?o2)
      (pain ?o1)
    )
    :effect (and
      (not (province ?o2))
      (not (pain ?o1))
      (harmony)
      (province ?o1)
      (craves ?o1 ?o2)
    )
  )

  (:action feast
    :parameters (?o1 - obj ?o2 - obj)
    :precondition (and
      (craves ?o1 ?o2)
      (province ?o1)
      (harmony)
    )
    :effect (and
      (not (craves ?o1 ?o2))
      (not (province ?o1))
      (not (harmony))
      (pain ?o1)
      (province ?o2)
    )
  )
)