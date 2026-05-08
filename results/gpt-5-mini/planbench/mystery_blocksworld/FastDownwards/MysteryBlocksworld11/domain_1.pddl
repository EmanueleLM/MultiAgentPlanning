(define (domain orchestration)
  (:requirements :strips :typing)
  (:types entity)

  (:predicates
    (province ?e - entity)
    (planet   ?e - entity)
    (pain     ?e - entity)
    (craves   ?a - entity ?b - entity)
    (harmony)
  )

  (:action attacker-attack
    :parameters (?prov - entity ?pl - entity)
    :precondition (and (province ?prov) (planet ?pl) (harmony))
    :effect (and
      (pain ?prov)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  (:action feaster-feast
    :parameters (?x - entity ?y - entity)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  (:action succumber-succumb
    :parameters (?x - entity)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcomer-overcome
    :parameters (?x - entity ?y - entity)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )
)