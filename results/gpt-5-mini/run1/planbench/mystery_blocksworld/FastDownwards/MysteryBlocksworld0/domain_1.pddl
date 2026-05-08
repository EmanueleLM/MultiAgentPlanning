(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)
    (craves ?x - obj ?y - obj)
  )

  ;; Action namespaced by agent: attacker
  (:action attacker_attack
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Actions namespaced by agent: feaster
  (:action feaster_succumb
    :parameters (?o - obj)
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

  (:action feaster_feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )

  ;; Action namespaced by agent: overcomer
  (:action overcomer_overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain))
    )
  )
)