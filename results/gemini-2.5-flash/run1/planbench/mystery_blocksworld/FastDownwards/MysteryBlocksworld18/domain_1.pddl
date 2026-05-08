(define (domain mystery_blocksworld18)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  ;; To perform Attack action, the following facts need to be true: Province object, Planet object, Harmony.
  ;; Once Attack action is performed the following facts will be true: Pain object.
  ;; Once Attack action is performed the following facts will be false: Province object, Planet object, Harmony.
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

  ;; To perform Feast action, the following needs to be true: Object Craves other object, Province object, Harmony.
  ;; Once Feast action is performed the following will be true: Pain object, Province other object.
  ;; Once Feast action is performed the following will be false:, Object Craves other object, Province object, Harmony.
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

  ;; To perform Succumb action, the following facts need to be true: Pain object.
  ;; Once Succumb action is performed the following facts will be true: Province object, Planet object, Harmony.
  ;; Once Succumb action is performed the following facts will be false: Pain object.
  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; To perform Overcome action, the following needs to be true: Province other object, Pain object.
  ;; Once Overcome action is performed the following will be true: Harmony, Province object, Object Craves other object.
  ;; Once Overcome action is performed the following will be false: Province other object, Pain object.
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
)