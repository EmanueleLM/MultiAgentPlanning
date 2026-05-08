(define (domain mystery_blocksworld5)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; attacker actions: Attack and Succumb
  (:action attacker_attack
    :parameters (?o - obj)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action attacker_succumb
    :parameters (?o - obj)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; overcomer action: Overcome (creates a craving from ?o toward ?other)
  (:action overcomer_overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; feeder action: Feast (consumes a craving and transfers province)
  (:action feeder_feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
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
    )
  )
)