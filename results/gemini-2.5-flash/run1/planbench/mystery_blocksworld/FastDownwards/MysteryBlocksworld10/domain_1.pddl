(define (domain MysteryBlocksworld10)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types object)

  (:predicates
    (Province ?o - object)
    (Planet ?o - object)
    (Harmony)
    (Pain ?o - object)
    (ObjectCraves ?o1 - object ?o2 - object)
  )

  (:functions
    (total-cost)
  )

  (:action attack
    :parameters (?o - object)
    :precondition (and
      (Province ?o)
      (Planet ?o)
      (Harmony)
    )
    :effect (and
      (not (Province ?o))
      (not (Planet ?o))
      (not (Harmony))
      (Pain ?o)
      (increase (total-cost) 1)
    )
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (Pain ?o)
    )
    :effect (and
      (not (Pain ?o))
      (Province ?o)
      (Planet ?o)
      (Harmony)
      (increase (total-cost) 1)
    )
  )

  (:action overcome
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
      (Province ?o2)
      (Pain ?o1)
    )
    :effect (and
      (not (Province ?o2))
      (not (Pain ?o1))
      (Harmony)
      (Province ?o1)
      (ObjectCraves ?o1 ?o2)
      (increase (total-cost) 1)
    )
  )

  (:action feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
      (ObjectCraves ?o1 ?o2)
      (Province ?o1)
      (Harmony)
    )
    :effect (and
      (not (ObjectCraves ?o1 ?o2))
      (not (Province ?o1))
      (not (Harmony))
      (Pain ?o1)
      (Province ?o2)
      (increase (total-cost) 1)
    )
  )
)