(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)                       ;; global pain fluent (no object argument) per specification wording
    (craves ?o1 - obj ?o2 - obj)
  )

  ;; Attack: requires a province on ?x, a planet on ?y, and global harmony.
  ;; Effects: set global pain, remove province ?x, remove planet ?y, remove harmony.
  (:action attack
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?x)
      (planet ?y)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?x))
      (not (planet ?y))
      (not (harmony))
    )
  )

  ;; Succumb: requires global pain.
  ;; Effects: restore province and planet on the same object ?x, restore harmony, remove pain.
  (:action succumb
    :parameters (?x - obj)
    :precondition (and
      (pain)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
    )
  )

  ;; Overcome: requires province on the "other" object ?y and global pain.
  ;; Effects: restore harmony, grant province to ?x, create craves(?x,?y); consume province ?y and global pain.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?y)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Feast: requires craves(?x,?y), province ?x, and harmony.
  ;; Effects: set global pain, grant province to ?y; consume craves(?x,?y), province ?x, and harmony.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)