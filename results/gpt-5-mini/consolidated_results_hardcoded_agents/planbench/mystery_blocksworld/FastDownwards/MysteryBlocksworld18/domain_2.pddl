(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  ;; Domain-level constants for the problem objects are declared so an initializer
  ;; action can assert the original initial facts with a single zero-precondition action.
  (:constants a b c d - object)

  (:predicates
    (craves ?x - object ?y - object)   ; ?x craves ?y
    (province ?x - object)             ; province holds for object
    (planet ?x - object)               ; planet holds for object
    (pain)                             ; global pain flag
    (harmony)                          ; global harmony flag
  )

  ;; Initialization action: no preconditions, asserts the original initial facts.
  ;; This lets the problem :init remain minimal while preserving the same reachable states.
  (:action initialize
    :parameters ()
    :precondition (and)
    :effect (and
      (craves b d)
      (craves c a)
      (harmony)
      (planet a)
      (planet d)
      (province b)
      (province c)
    )
  )

  ;; Attack: requires that the target has province and planet and global harmony.
  ;; Effects: global pain becomes true; province, planet and harmony are removed for the target.
  (:action attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: requires global pain.
  ;; Effects: restores province and planet for the chosen object and restores harmony; clears pain.
  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (pain)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
    )
  )

  ;; Overcome: requires that "other" currently has province and that global pain is true.
  ;; Effects: sets harmony, grants province to actor object, makes actor crave other;
  ;;          removes province from other and clears pain.
  (:action overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (province ?other)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain))
    )
  )

  ;; Feast: requires that actor craves other, actor has province, and global harmony.
  ;; Effects: sets global pain, grants province to other, and removes the craving, actor's province, and harmony.
  (:action feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)