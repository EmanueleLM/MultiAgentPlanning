(define (domain cravings-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?from - obj ?to - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (harmony)
  )

  (:action attacker_attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb_succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcomer_overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  (:action feaster_feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)