(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object province planet)

  (:predicates
    (harmony)
    (pain ?o - object)
    (craves ?s - object ?t - object)
    (controls ?o - object ?p - province)
    (province-on ?p - province ?pl - planet)
    (exists-province ?p - province)
    (exists-planet ?pl - planet)
  )

  ;; Attacker agent's Attack action
  (:action attacker-attack
    :parameters (?att - object ?p - province ?pl - planet)
    :precondition (and
      (controls ?att ?p)
      (province-on ?p ?pl)
      (harmony)
    )
    :effect (and
      (pain ?att)
      (not (controls ?att ?p))
      (not (province-on ?p ?pl))
      (not (harmony))
    )
  )

  ;; Succumber agent's Succumb action
  (:action succumber-succumb
    :parameters (?actor - object ?p - province ?pl - planet)
    :precondition (and
      (pain ?actor)
    )
    :effect (and
      (controls ?actor ?p)
      (province-on ?p ?pl)
      (harmony)
      (not (pain ?actor))
    )
  )

  ;; Overcomer agent's Overcome action
  (:action overcome-overcome
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