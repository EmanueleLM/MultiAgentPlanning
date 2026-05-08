(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?v1 ?v2 - obj)
    (province ?v1 - obj)
    (planet ?v1 - obj)
    (harmony)
    (pain ?v1 - obj)
  )

  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x ?y - obj)
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