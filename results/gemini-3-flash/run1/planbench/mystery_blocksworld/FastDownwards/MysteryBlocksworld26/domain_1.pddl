(define (domain mystery_blocksworld_26)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (craves ?x ?y - object)
    (harmony)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (province ?x)
      (craves ?x ?y)
      (harmony)
      (not (pain ?x))
      (not (province ?y))
    )
  )

  (:action feast
    :parameters (?x - object ?y - object)
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