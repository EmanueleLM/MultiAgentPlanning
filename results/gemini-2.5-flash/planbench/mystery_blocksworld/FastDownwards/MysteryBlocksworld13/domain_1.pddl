(define (domain mystery_blocksworld13)
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
  ;; To perform Attack action, the following facts need to be true: Province object, Planet object, Harmony.
  ;; Once Attack action is performed the following facts will be true: Pain object.
  ;; Once Attack action is performed the following facts will be false: Province object, Planet object, Harmony.
  (:action attack
    :parameters (?x - object)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb object
  ;; To perform Succumb action, the following facts need to be true: Pain object.
  ;; Once Succumb action is performed the following facts will be true: Province object, Planet object, Harmony.
  ;; Once Succumb action is performed the following facts will be false: Pain object.
  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome object from another object
  ;; To perform Overcome action, the following needs to be true: Province other object, Pain object.
  ;; Once Overcome action is performed the following will be true: Harmony, Province object, Object Craves other object.
  ;; Once Overcome action is performed the following will be false: Province other object, Pain object.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (province ?y)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast object from another object
  ;; To perform Feast action, the following needs to be true: Object Craves other object, Province object, Harmony.
  ;; Once Feast action is performed the following will be true: Pain object, Province other object.
  ;; Once Feast action is performed the following will be false:, Object Craves other object, Province object, Harmony.
  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)