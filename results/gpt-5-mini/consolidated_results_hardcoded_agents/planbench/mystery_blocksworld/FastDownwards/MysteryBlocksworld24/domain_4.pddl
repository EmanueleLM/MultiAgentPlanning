(define (domain mysteryblocksworld24)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (planet ?x - object)
    (province ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x - object ?y - object)
  )

  (:action attacker-attack
    :parameters (?x - object)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumber-succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcomer-overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (province ?y)
      (pain ?x)
      (not (= ?x ?y))
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  (:action feaster-feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (not (= ?x ?y))
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)