(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object province stage)

  (:predicates
    (harmony)
    (planet ?o - object)
    (pain ?o - object)
    (craves ?s - object ?t - object)
    (controls ?o - object ?p - province)
    (orig-province ?o - object ?p - province)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action attacker-attack
    :parameters (?att - object ?p - province ?s - stage ?s2 - stage)
    :precondition (and
      (controls ?att ?p)
      (planet ?att)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?att)
      (not (controls ?att ?p))
      (not (planet ?att))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action succumber-succumb
    :parameters (?actor - object ?p - province ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?actor)
      (orig-province ?actor ?p)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (controls ?actor ?p)
      (planet ?actor)
      (harmony)
      (not (pain ?actor))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action overcomer-overcome
    :parameters (?actor - object ?other - object ?p - province ?s - stage ?s2 - stage)
    :precondition (and
      (controls ?other ?p)
      (pain ?actor)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (controls ?actor ?p)
      (craves ?actor ?other)
      (not (controls ?other ?p))
      (not (pain ?actor))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action feaster-feast
    :parameters (?actor - object ?other - object ?p - province ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?actor ?other)
      (controls ?actor ?p)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?actor)
      (controls ?other ?p)
      (not (craves ?actor ?other))
      (not (controls ?actor ?p))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)