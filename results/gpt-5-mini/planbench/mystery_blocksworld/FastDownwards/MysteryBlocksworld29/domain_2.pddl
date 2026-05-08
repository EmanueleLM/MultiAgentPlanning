(define (domain mysteryblocksworld29)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
  )

  ;; Attack requires a province object and a (possibly different) planet object, and harmony.
  ;; Effects: produce pain on the province object; remove that province, remove the planet fact on the planet object, and remove harmony.
  (:action attack
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain ?prov)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb consumes pain on an object and restores province, planet, and harmony for that same object.
  (:action succumb
    :parameters (?o - obj)
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

  ;; Overcome requires some other object to be a province and the actor to be in pain.
  ;; Effects: restores harmony, makes the actor a province, creates a craves relation (actor -> other),
  ;; and removes the other's province and the actor's pain.
  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast requires the actor to crave some other, the actor to be a province, and harmony.
  ;; Effects: produces pain on the actor, makes the other a province, and removes the craves, the actor's province, and harmony.
  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)