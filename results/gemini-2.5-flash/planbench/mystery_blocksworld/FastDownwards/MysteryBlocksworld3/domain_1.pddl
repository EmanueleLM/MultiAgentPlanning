(define (domain mystery_blocksworld3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (object_craves ?o1 - obj ?o2 - obj)
  )

  (:action attack
    :parameters (?o - obj)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
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
    :parameters (?o1 - obj ?o2 - obj)
    :precondition (and
      (province ?o2)
      (pain ?o1)
    )
    :effect (and
      (harmony)
      (province ?o1)
      (object_craves ?o1 ?o2)
      (not (province ?o2))
      (not (pain ?o1))
    )
  )

  (:action feast
    :parameters (?o1 - obj ?o2 - obj)
    :precondition (and
      (object_craves ?o1 ?o2)
      (province ?o1)
      (harmony)
    )
    :effect (and
      (pain ?o1)
      (province ?o2)
      (not (object_craves ?o1 ?o2))
      (not (province ?o1))
      (not (harmony))
    )
  )
)