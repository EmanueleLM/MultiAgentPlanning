(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (planet ?x - obj)
    (province ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: requires an object that is both a province and a planet and global harmony.
  ;; Effects: produce pain on the object and remove its province & planet status and remove harmony.
  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  ;; Succumb: reverses pain into province, planet and restores harmony.
  (:action succumb
    :parameters (?o - obj)
    :precondition (and (pain ?o))
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
            )
  )

  ;; Overcome: requires some other object to be a province and the actor to have pain.
  ;; Effects: produces harmony, gives the actor a province, creates a craves link actor->other,
  ;; and removes the other's province and the actor's pain.
  (:action overcome
    :parameters (?actor - obj ?other - obj)
    :precondition (and (province ?other) (pain ?actor))
    :effect (and
              (harmony)
              (province ?actor)
              (craves ?actor ?other)
              (not (province ?other))
              (not (pain ?actor))
            )
  )

  ;; Feast: consumes a craves relation when the craver is a province and harmony holds.
  ;; Effects: produces pain on the craver, gives province to the craved (other) object,
  ;; and removes the craves relation, the craver's province, and harmony.
  (:action feast
    :parameters (?craver - obj ?other - obj)
    :precondition (and (craves ?craver ?other) (province ?craver) (harmony))
    :effect (and
              (pain ?craver)
              (province ?other)
              (not (craves ?craver ?other))
              (not (province ?craver))
              (not (harmony))
            )
  )
)