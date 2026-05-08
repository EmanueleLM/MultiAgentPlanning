(define (domain harmony-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
    (current-stage ?s - stage)
    (succ ?s1 ?s2 - stage)
  )

  (:action attack
    :parameters (?o - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?o) (planet ?o) (harmony) (current-stage ?s) (succ ?s ?s2))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action succumb
    :parameters (?o - obj ?s - stage ?s2 - stage)
    :precondition (and (pain ?o) (current-stage ?s) (succ ?s ?s2))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action overcome
    :parameters (?o - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?other) (pain ?o) (current-stage ?s) (succ ?s ?s2))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action feast
    :parameters (?actor - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (craves ?actor ?other) (province ?actor) (harmony) (current-stage ?s) (succ ?s ?s2))
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)