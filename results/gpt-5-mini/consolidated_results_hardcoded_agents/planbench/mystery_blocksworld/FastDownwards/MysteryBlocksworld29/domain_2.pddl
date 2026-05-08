(define (domain mysteryblocksworld29)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
    (now ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action attack
    :parameters (?o - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (pain ?o)
      (not (now ?s))
      (now ?t)
    )
  )

  (:action succumb
    :parameters (?o - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (now ?s))
      (now ?t)
    )
  )

  (:action overcome
    :parameters (?o - obj ?other - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
      (not (now ?s))
      (now ?t)
    )
  )

  (:action feast
    :parameters (?o - obj ?other - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
      (not (now ?s))
      (now ?t)
    )
  )
)