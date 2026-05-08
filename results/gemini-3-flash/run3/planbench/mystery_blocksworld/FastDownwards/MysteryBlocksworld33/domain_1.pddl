(define (domain mystery_blocksworld_33)
  (:requirements :strips :typing)
  (:types item)
  (:predicates
    (province ?v - item)
    (planet ?v - item)
    (harmony)
    (pain ?v - item)
    (craves ?v1 ?v2 - item)
  )

  (:action attack
    :parameters (?v - item)
    :precondition (and (province ?v) (planet ?v) (harmony))
    :effect (and (pain ?v) (not (province ?v)) (not (planet ?v)) (not (harmony)))
  )

  (:action succumb
    :parameters (?v - item)
    :precondition (pain ?v)
    :effect (and (province ?v) (planet ?v) (harmony) (not (pain ?v)))
  )

  (:action overcome
    :parameters (?v1 ?v2 - item)
    :precondition (and (pain ?v1) (province ?v2))
    :effect (and (harmony) (province ?v1) (craves ?v1 ?v2) (not (pain ?v1)) (not (province ?v2)))
  )

  (:action feast
    :parameters (?v1 ?v2 - item)
    :precondition (and (harmony) (province ?v1) (craves ?v1 ?v2))
    :effect (and (pain ?v1) (province ?v2) (not (harmony)) (not (province ?v1)) (not (craves ?v1 ?v2)))
  )
)