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
    :parameters (?v1 - obj)
    :precondition (and (province ?v1) (planet ?v1) (harmony))
    :effect (and
      (not (province ?v1))
      (not (planet ?v1))
      (not (harmony))
      (pain ?v1)
    )
  )

  (:action succumb
    :parameters (?v1 - obj)
    :precondition (pain ?v1)
    :effect (and
      (not (pain ?v1))
      (province ?v1)
      (planet ?v1)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (province ?v2) (pain ?v1))
    :effect (and
      (not (province ?v2))
      (not (pain ?v1))
      (harmony)
      (province ?v1)
      (craves ?v1 ?v2)
    )
  )

  (:action feast
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and
      (not (craves ?v1 ?v2))
      (not (province ?v1))
      (not (harmony))
      (pain ?v1)
      (province ?v2)
    )
  )
)