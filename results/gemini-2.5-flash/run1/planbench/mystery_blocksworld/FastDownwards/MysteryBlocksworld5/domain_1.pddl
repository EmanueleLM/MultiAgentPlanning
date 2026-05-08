(define (domain MysteryBlocksworld5)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  ;; Action 1: Attack object (O)
  (:action attack
    :parameters (?o - object)
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

  ;; Action 2: Succumb object (O)
  (:action succumb
    :parameters (?o - object)
    :precondition (pain ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Action 3: Overcome object (O1) from another object (O2)
  (:action overcome
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
      (province ?o2)
      (pain ?o1)
    )
    :effect (and
      (harmony)
      (province ?o1)
      (craves ?o1 ?o2)
      (not (province ?o2))
      (not (pain ?o1))
    )
  )

  ;; Action 4: Feast object (O1) from another object (O2)
  (:action feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
      (craves ?o1 ?o2)
      (province ?o1)
      (harmony)
    )
    :effect (and
      (pain ?o1)
      (province ?o2)
      (not (craves ?o1 ?o2))
      (not (province ?o1))
      (not (harmony))
    )
  )
)