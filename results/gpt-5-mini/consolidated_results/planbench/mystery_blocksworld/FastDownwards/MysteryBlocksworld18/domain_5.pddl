(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (pain)
    (harmony)
    (now ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action attack
    :parameters (?o - object ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - object ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (pain)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
    )
  )

  (:action overcome
    :parameters (?actor - object ?other - object ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (province ?other)
      (pain)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain))
    )
  )

  (:action feast
    :parameters (?actor - object ?other - object ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (pain)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)