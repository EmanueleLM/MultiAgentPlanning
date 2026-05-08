(define (domain mystery-blocksworld29)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x ?y - object)
    (different ?x ?y - object)
  )

  ;; Attack: requires the object to be both a province and a planet and harmony.
  ;; Effects: produce pain on that object and remove province, planet, and harmony.
  (:action attack
    :parameters (?o - object)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: when an object has pain it regains province and planet status and harmony, and pain is removed.
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

  ;; Overcome: requires some other object to be a province and the actor to be in pain.
  ;; Other must be a different object.
  ;; Effects: grants harmony, makes actor a province, creates craves(actor, other),
  ;; and removes the other object's province and the actor's pain.
  (:action overcome
    :parameters (?o - object ?other - object)
    :precondition (and (province ?other) (pain ?o) (different ?o ?other))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: requires actor to crave other, actor to be a province, and harmony.
  ;; Other must be a different object.
  ;; Effects: produces pain for actor, grants province to the other object,
  ;; and removes the craves relation, the actor's province, and harmony.
  (:action feast
    :parameters (?o - object ?other - object)
    :precondition (and (craves ?o ?other) (province ?o) (harmony) (different ?o ?other))
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)