(define (domain mystery-blocksworld)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (harmony)
    (pain ?o)
    (craves ?o ?p)
    (province ?o)
    (planet ?o)
  )

  ;; attacker: Attack - requires the object to be both a province and a planet and global harmony.
  ;; Effects: that object acquires pain, and loses province, planet and harmony.
  (:action attacker_attack
    :parameters (?o)
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

  ;; succumber: Succumb - requires an object in pain; restores province, planet and harmony; removes pain.
  (:action succumber_succumb
    :parameters (?o)
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

  ;; overcomer: Overcome - requires the actor to be in pain and the other to be a province.
  ;; Effects: restores harmony, gives the actor a province and a craving toward the other,
  ;; removes the other's province and the actor's pain.
  (:action overcomer_overcome
    :parameters (?actor ?other)
    :precondition (and
      (pain ?actor)
      (province ?other)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
    )
  )

  ;; feaster: Feast - requires eater craves target, eater is a province and harmony holds.
  ;; Effects: eater acquires pain, target gains province; craving, eater's province and harmony are removed.
  (:action feaster_feast
    :parameters (?eater ?target)
    :precondition (and
      (craves ?eater ?target)
      (province ?eater)
      (harmony)
    )
    :effect (and
      (pain ?eater)
      (province ?target)
      (not (craves ?eater ?target))
      (not (province ?eater))
      (not (harmony))
    )
  )
)