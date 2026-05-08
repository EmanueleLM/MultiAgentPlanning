(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object province planet stage)

  (:predicates
    (harmony)
    (pain ?o - object)
    (craves ?s - object ?t - object)
    (controls ?o - object ?p - province)
    (province-on ?p - province ?pl - planet)
    (now ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  ;; Attacker agent's Attack action (advances global stage)
  (:action attacker-attack
    :parameters (?att - object ?p - province ?pl - planet ?t - stage ?t2 - stage)
    :precondition (and
      (controls ?att ?p)
      (province-on ?p ?pl)
      (harmony)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?att)
      (not (controls ?att ?p))
      (not (province-on ?p ?pl))
      (not (harmony))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Succumber agent's Succumb action (advances global stage)
  (:action succumber-succumb
    :parameters (?actor - object ?p - province ?pl - planet ?t - stage ?t2 - stage)
    :precondition (and
      (pain ?actor)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (controls ?actor ?p)
      (province-on ?p ?pl)
      (harmony)
      (not (pain ?actor))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Overcomer agent's Overcome action (advances global stage)
  (:action overcomer-overcome
    :parameters (?actor - object ?other - object ?p - province ?t - stage ?t2 - stage)
    :precondition (and
      (controls ?other ?p)
      (pain ?actor)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (harmony)
      (controls ?actor ?p)
      (craves ?actor ?other)
      (not (controls ?other ?p))
      (not (pain ?actor))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Feaster agent's Feast action (advances global stage)
  (:action feaster-feast
    :parameters (?actor - object ?other - object ?p - province ?t - stage ?t2 - stage)
    :precondition (and
      (craves ?actor ?other)
      (controls ?actor ?p)
      (harmony)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?actor)
      (controls ?other ?p)
      (not (craves ?actor ?other))
      (not (controls ?actor ?p))
      (not (harmony))
      (not (now ?t))
      (now ?t2)
    )
  )
)