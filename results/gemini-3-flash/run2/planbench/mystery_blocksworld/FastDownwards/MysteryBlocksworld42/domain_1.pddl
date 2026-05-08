(define (domain mystery_blocksworld)
  (:requirements :strips)
  (:predicates
    (province ?v1)
    (planet ?v1)
    (harmony)
    (pain ?v1)
    (craves ?v1 ?v2)
  )

  (:action attack
    :parameters (?v1)
    :precondition (and (province ?v1) (planet ?v1) (harmony))
    :effect (and (pain ?v1) (not (province ?v1)) (not (planet ?v1)) (not (harmony)))
  )

  (:action succumb
    :parameters (?v1)
    :precondition (pain ?v1)
    :effect (and (province ?v1) (planet ?v1) (harmony) (not (pain ?v1)))
  )

  (:action overcome
    :parameters (?v1 ?v2)
    :precondition (and (province ?v2) (pain ?v1))
    :effect (and (harmony) (province ?v1) (craves ?v1 ?v2) (not (province ?v2)) (not (pain ?v1)))
  )

  (:action feast
    :parameters (?v1 ?v2)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and (pain ?v1) (province ?v2) (not (craves ?v1 ?v2)) (not (province ?v1)) (not (harmony)))
  )
)