(define (domain mystery-blocksworld)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 ?o2 - object)
  )

  (:action attack
    :parameters (?o - object)
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
    :parameters (?o - object)
    :precondition (pain ?o)
    :effect (and
      (not (pain ?o))
      (province ?o)
      (planet ?o)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?o1 - object ?o2 - object)
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
    :parameters (?o1 - object ?o2 - object)
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