(define (domain mystery_blocksworld25)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: produces pain on the same object and removes its province, planet and global harmony
  (:action attack
    :parameters (?x - obj)
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

  ;; Succumb: consumes pain and restores province, planet and harmony for the same object
  (:action succumb
    :parameters (?x - obj)
    :precondition (and
      (pain ?x)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: requires the other object to have a province and the primary object to be in pain.
  ;; Transfers province to the primary object, creates a craves relation from primary->other,
  ;; restores harmony and removes the other's province and the primary's pain.
  (:action overcome
    :parameters (?x - obj ?y - obj)
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

  ;; Feast: consumes an existing craves relation when the feeder has a province and harmony.
  ;; Produces pain on the feeder, gives province to the craved object, and removes the craves,
  ;; the feeder's province, and harmony.
  (:action feast
    :parameters (?x - obj ?y - obj)
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