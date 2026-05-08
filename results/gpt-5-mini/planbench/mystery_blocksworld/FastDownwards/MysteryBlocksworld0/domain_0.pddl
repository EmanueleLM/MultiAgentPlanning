(define (domain craving_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)
  (:predicates
    (province ?x - thing)
    (planet ?x - thing)
    (harmony)
    (pain)
    (craves ?x - thing ?y - thing)
  )

  ;; Namespaced actions to keep origins distinct
  (:action attacker-attack
    :parameters (?x - thing)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action feaster-feast
    :parameters (?x - thing ?y - thing)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  (:action succumber-succumb
    :parameters (?x - thing)
    :precondition (pain)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
    )
  )

  (:action overcomer-overcome
    :parameters (?x - thing ?y - thing)
    :precondition (and (province ?y) (pain))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )
)