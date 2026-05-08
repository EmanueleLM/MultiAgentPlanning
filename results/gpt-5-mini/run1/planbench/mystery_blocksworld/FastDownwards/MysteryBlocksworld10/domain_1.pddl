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

  ;; Attack: requires the same object to be both a province and a planet and global harmony.
  ;; Effects: that object becomes in pain, loses province and planet status, and harmony is lost.
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

  ;; Succumb: requires an object in pain; restores province, planet and global harmony, removes pain.
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

  ;; Overcome: actor with pain overcomes a different object that currently is a province.
  ;; Effects: restores harmony, grants the actor a province and a craving toward the other,
  ;; removes the other's province and the actor's pain.
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

  ;; Feast: an eater that craves a target and currently holds a province while harmony holds
  ;; consumes the craving: eater receives pain, the target gains the province,
  ;; and the craving, eater's province and harmony are removed.
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