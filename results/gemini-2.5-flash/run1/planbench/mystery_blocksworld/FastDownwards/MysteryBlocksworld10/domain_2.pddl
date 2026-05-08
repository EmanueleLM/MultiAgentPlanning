(define (domain MysteryBlocksworld10)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (object_craves ?o1 - object ?o2 - object)
  )

  (:functions
    (total-cost)
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
      (increase (total-cost) 1)
    )
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (not (pain ?o))
      (province ?o)
      (planet ?o)
      (harmony)
      (increase (total-cost) 1)
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
      (object_craves ?o1 ?o2)
      (increase (total-cost) 1)
    )
  )

  (:action feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
      (object_craves ?o1 ?o2)
      (province ?o1)
      (harmony)
    )
    :effect (and
      (not (object_craves ?o1 ?o2))
      (not (province ?o1))
      (not (harmony))
      (pain ?o1)
      (province ?o2)
      (increase (total-cost) 1)
    )
  )