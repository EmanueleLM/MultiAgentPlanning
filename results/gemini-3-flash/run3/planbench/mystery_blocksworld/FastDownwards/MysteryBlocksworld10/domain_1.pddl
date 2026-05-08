(define (domain mystery_blocksworld_10)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (province ?x - block)
    (planet ?x - block)
    (pain ?x - block)
    (craves ?x ?y - block)
    (harmony)
  )

  (:action attack
    :parameters (?x - block)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - block)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x - block ?y - block)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  (:action overcome
    :parameters (?x - block ?y - block)
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