(define (domain struggle)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?other - obj)
    (harmony)
    (pain)
    ;; explicit discrete stage progression to enforce ordering
    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Each action must be executed at a current stage ?s and advances the unique global
  ;; "at-stage" marker to the successor stage ?s2. This enforces total ordering of actions
  ;; and makes stage progression an explicit hard requirement (no soft tokens).
  ;; Actions implement the human-specified preconditions and effects exactly.

  (:action attack
    :parameters (?p - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (province ?p) (planet ?pl) (harmony))
    :effect (and
              (not (province ?p))
              (not (planet ?pl))
              (not (harmony))
              (pain)
              (not (at-stage ?s))
              (at-stage ?s2))
  )

  (:action succumb
    :parameters (?p - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (pain))
    :effect (and
              (not (pain))
              (harmony)
              (province ?p)
              (planet ?pl)
              (not (at-stage ?s))
              (at-stage ?s2))
  )

  (:action overcome
    :parameters (?obj - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (province ?other) (pain))
    :effect (and
              (harmony)
              (province ?obj)
              (craves ?obj ?other)
              (not (province ?other))
              (not (pain))
              (not (at-stage ?s))
              (at-stage ?s2))
  )

  (:action feast
    :parameters (?a - obj ?b - obj ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (craves ?a ?b) (province ?a) (harmony))
    :effect (and
              (pain)
              (province ?b)
              (not (craves ?a ?b))
              (not (province ?a))
              (not (harmony))
              (not (at-stage ?s))
              (at-stage ?s2))
  )
)