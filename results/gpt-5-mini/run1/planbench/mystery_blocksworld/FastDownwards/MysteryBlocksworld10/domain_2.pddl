(define (domain mystery-blocksworld)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (harmony)
    (pain ?o)
    (craves ?o ?p)
    (province ?o)
    (planet ?o)
    (distinct ?x ?y)
  )

  ;; Attack: requires the object to be a province and a planet and global harmony.
  ;; Effects: that object acquires pain, and loses province, planet and harmony.
  (:action attack
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

  ;; Succumb: requires an object in pain; restores province, planet and harmony; removes pain.
  (:action succumb
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

  ;; Overcome: requires the winner to be in pain and the other to be a province.
  ;; Effects: restores harmony, gives the winner a province and a craving toward the other,
  ;; removes the other's province and the winner's pain.
  (:action overcome
    :parameters (?winner ?other)
    :precondition (and
      (province ?other)
      (pain ?winner)
      (distinct ?winner ?other)
    )
    :effect (and
      (harmony)
      (province ?winner)
      (craves ?winner ?other)
      (not (province ?other))
      (not (pain ?winner))
    )
  )

  ;; Feast: requires eater craves target, eater is a province and harmony holds.
  ;; Effects: eater acquires pain, target gains province; craving, eater's province and harmony are removed.
  (:action feast
    :parameters (?eater ?target)
    :precondition (and
      (craves ?eater ?target)
      (province ?eater)
      (harmony)
      (distinct ?eater ?target)
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