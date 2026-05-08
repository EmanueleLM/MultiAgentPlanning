(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object province)

  (:predicates
    (harmony)
    (pain ?o - object)
    (craves ?s - object ?t - object)
    (controls ?o - object ?p - province)
  )

  ;; Attacker agent's Attack action
  (:action attacker-attack
    :parameters (?att - object ?p - province)
    :precondition (and
      (controls ?att ?p)
      (harmony)
    )
    :effect (and
      (pain ?att)
      (not (controls ?att ?p))
      (not (harmony))
    )
  )

  ;; Succumber agent's Succumb action
  (:action succumber-succumb
    :parameters (?actor - object ?p - province)
    :precondition (and
      (pain ?actor)
    )
    :effect (and
      (controls ?actor ?p)
      (harmony)
      (not (pain ?actor))
    )
  )

  ;; Overcomer agent's Overcome action
  (:action overcomer-overcome
    :parameters (?actor - object ?other - object ?p - province)
    :precondition (and
      (controls ?other ?p)
      (pain ?actor)
    )
    :effect (and
      (harmony)
      (controls ?actor ?p)
      (craves ?actor ?other)
      (not (controls ?other ?p))
      (not (pain ?actor))
    )
  )

  ;; Feaster agent's Feast action
  (:action feaster-feast
    :parameters (?actor - object ?other - object ?p - province)
    :precondition (and
      (craves ?actor ?other)
      (controls ?actor ?p)
      (harmony)
    )
    :effect (and
      (pain ?actor)
      (controls ?other ?p)
      (not (craves ?actor ?other))
      (not (controls ?actor ?p))
      (not (harmony))
    )
  )
)