(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
  )

  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
    )
  )

  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (not (pain ?x))
      (not (province ?y))
      (harmony)
      (province ?x)
      (craves ?x ?y)
    )
  )

  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (harmony) (province ?x) (craves ?x ?y))
    :effect (and
      (not (harmony))
      (not (province ?x))
      (not (craves ?x ?y))
      (pain ?x)
      (province ?y)
    )
  )
)