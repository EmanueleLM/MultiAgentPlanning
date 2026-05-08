(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?v - obj)
    (planet ?v - obj)
    (pain ?v - obj)
    (craves ?v1 ?v2 - obj)
    (harmony)
  )

  (:action attack
    :parameters (?v - obj)
    :precondition (and (province ?v) (planet ?v) (harmony))
    :effect (and (pain ?v) (not (province ?v)) (not (planet ?v)) (not (harmony)))
  )

  (:action succumb
    :parameters (?v - obj)
    :precondition (pain ?v)
    :effect (and (province ?v) (planet ?v) (harmony) (not (pain ?v)))
  )

  (:action overcome
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (province ?v2) (pain ?v1))
    :effect (and (harmony) (province ?v1) (craves ?v1 ?v2) (not (province ?v2)) (not (pain ?v1)))
  )

  (:action feast
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and (pain ?v1) (province ?v2) (not (craves ?v1 ?v2)) (not (province ?v1)) (not (harmony)))
  )
)