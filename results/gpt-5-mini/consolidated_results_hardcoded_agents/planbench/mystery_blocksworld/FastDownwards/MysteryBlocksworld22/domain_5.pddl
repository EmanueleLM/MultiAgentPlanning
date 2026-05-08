(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing stage)
  (:predicates
    (craves ?who - thing ?what - thing)
    (province ?x - thing)
    (planet ?x - thing)
    (pain ?x - thing)
    (harmony)
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  (:action attack_agent-attack
    :parameters (?x - thing ?s - stage ?s2 - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action succumb_agent-succumb
    :parameters (?x - thing ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?x)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action overcome_agent-overcome
    :parameters (?obj - thing ?other - thing ?s - stage ?s2 - stage)
    :precondition (and
      (province ?other)
      (pain ?obj)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action feast_agent-feast
    :parameters (?who - thing ?whom - thing ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?who ?whom)
      (province ?who)
      (harmony)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (pain ?who)
      (province ?whom)
      (not (craves ?who ?whom))
      (not (province ?who))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)