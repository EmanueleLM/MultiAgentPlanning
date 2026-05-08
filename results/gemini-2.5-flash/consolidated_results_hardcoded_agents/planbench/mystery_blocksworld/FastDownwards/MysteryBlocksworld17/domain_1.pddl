(define (domain MysteryBlocksworld17)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  ;; Attack object
  ;; Pre: Province object, Planet object, Harmony
  ;; Eff: Add Pain object, Del Province object, Planet object, Harmony
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

  ;; Succumb object
  ;; Pre: Pain object
  ;; Eff: Add Province object, Planet object, Harmony, Del Pain object
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

  ;; Overcome object (?o1) from other object (?o2)
  ;; Pre: Province other object (?o2), Pain object (?o1)
  ;; Eff: Add Harmony, Province object (?o1), Craves object other object (?o1 ?o2)
  ;; Del: Province other object (?o2), Pain object (?o1)
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

  ;; Feast object (?o1) from other object (?o2)
  ;; Pre: Craves object other object (?o1 ?o2), Province object (?o1), Harmony
  ;; Eff: Add Pain object (?o1), Province other object (?o2)
  ;; Del: Craves object other object (?o1 ?o2), Province object (?o1), Harmony
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