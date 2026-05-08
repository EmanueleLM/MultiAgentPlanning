(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action attacker_attack
    :parameters (?p - obj ?pl - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (not (province ?p))
      (not (planet ?pl))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  (:action succumber_succumb
    :parameters (?x - obj ?from - stage ?to - stage)
    :precondition (and
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  (:action overcomer_overcome
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?other)
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  (:action feaster_feast
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )
)