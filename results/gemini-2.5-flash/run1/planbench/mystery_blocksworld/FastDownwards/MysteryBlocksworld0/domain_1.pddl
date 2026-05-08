(define (domain mystery_blocksworld0)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  ;; Action 1: Attack object
  ;; Pre: Province object, Planet object, Harmony.
  ;; Effects: Add Pain object. Del Province object, Planet object, Harmony.
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

  ;; Action 2: Succumb object
  ;; Pre: Pain object.
  ;; Effects: Add Province object, Planet object, Harmony. Del Pain object.
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

  ;; Action 3: Overcome object from another object
  ;; Pre: Province other object, Pain object. (Structured: Province(?o2), Pain(?o1))
  ;; Effects: Add Harmony, Province object, Object Craves other object. (Structured: Harmony, Province(?o1), Craves(?o1, ?o2))
  ;; Del Province other object, Pain object. (Structured: Province(?o2), Pain(?o1))
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

  ;; Action 4: Feast object from another object
  ;; Pre: Object Craves other object, Province object, Harmony. (Structured: Craves(?o1, ?o2), Province(?o1), Harmony)
  ;; Effects: Add Pain object, Province other object. (Structured: Pain(?o1), Province(?o2))
  ;; Del Object Craves other object, Province object, Harmony. (Structured: Craves(?o1, ?o2), Province(?o1), Harmony)
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