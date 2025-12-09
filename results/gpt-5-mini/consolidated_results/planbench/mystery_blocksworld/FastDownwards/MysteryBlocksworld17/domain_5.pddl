(define (domain struggle)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?other - obj)
    (harmony)
    (pain)
    (now ?s - stage)
    (next ?s - stage ?t - stage)
  )

  ;; Attacker action: Attack
  (:action attacker-attack
    :parameters (?p - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?p) (planet ?pl) (harmony) (now ?s) (next ?s ?s2))
    :effect (and
              (not (province ?p))
              (not (planet ?pl))
              (not (harmony))
              (pain)
              (not (now ?s))
              (now ?s2))
  )

  ;; Succumber action: Succumb
  ;; Restores the specified province and planet when pain is present.
  (:action succumber-succumb
    :parameters (?p - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (pain) (now ?s) (next ?s ?s2))
    :effect (and
              (not (pain))
              (harmony)
              (province ?p)
              (planet ?pl)
              (not (now ?s))
              (now ?s2))
  )

  ;; Overcomer action: Overcome
  ;; Uses a "other" province together with pain to produce harmony and a new crave link.
  (:action overcomer-overcome
    :parameters (?obj - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?other) (pain) (now ?s) (next ?s ?s2))
    :effect (and
              (harmony)
              (province ?obj)
              (craves ?obj ?other)
              (not (province ?other))
              (not (pain))
              (not (now ?s))
              (now ?s2))
  )

  ;; Feaster action: Feast
  (:action feaster-feast
    :parameters (?a - obj ?b - obj ?s - stage ?s2 - stage)
    :precondition (and (craves ?a ?b) (province ?a) (harmony) (now ?s) (next ?s ?s2))
    :effect (and
              (pain)
              (province ?b)
              (not (craves ?a ?b))
              (not (province ?a))
              (not (harmony))
              (not (now ?s))
              (now ?s2))
  )
)