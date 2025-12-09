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

  ;; Attack action by attack_agent
  ;; Requires the same object to be both a province and a planet (unambiguous)
  (:action attack_agent-attack
    :parameters (?p - thing ?s - stage ?s2 - stage)
    :precondition (and
      (province ?p)
      (planet ?p)
      (harmony)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (pain ?p)
      (not (province ?p))
      (not (planet ?p))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Succumb action by succumb_agent
  ;; Restores province, planet and harmony for the same object that had pain
  (:action succumb_agent-succumb
    :parameters (?p - thing ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?p)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (province ?p)
      (planet ?p)
      (harmony)
      (not (pain ?p))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Overcome action by overcome_agent
  ;; 'other' is the province to be consumed; obj is the one with pain that will gain craving to other
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

  ;; Feast action by feast_agent
  ;; 'who' craves 'whom' and 'who' must be a province and harmony must hold
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