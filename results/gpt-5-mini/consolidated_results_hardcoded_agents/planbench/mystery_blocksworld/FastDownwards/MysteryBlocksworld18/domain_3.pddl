(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (pain)
    (harmony)
  )

  ;; Initialization action: parameterized so the problem can keep an empty :init.
  ;; This avoids domain-level constants and keeps the problem initial state minimal.
  (:action initialize
    :parameters (?a - object ?b - object ?c - object ?d - object)
    :precondition (and)
    :effect (and
      (craves ?b ?d)
      (craves ?c ?a)
      (harmony)
      (planet ?a)
      (planet ?d)
      (province ?b)
      (province ?c)
    )
  )

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