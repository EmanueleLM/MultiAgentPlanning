(define (domain mystery_blocksworld_49)
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
    :effect (and (not (province ?v)) (not (planet ?v)) (not (harmony)) (pain ?v))
  )

  (:action succumb
    :parameters (?v - obj)
    :precondition (pain ?v)
    :effect (and (not (pain ?v)) (province ?v) (planet ?v) (harmony))
  )

  (:action feast
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and (not (craves ?v1 ?v2)) (not (province ?v1)) (not (harmony)) (pain ?v1) (province ?v2))
  )

  (:action overcome
    :parameters (?v1 - obj ?v2 - obj)
    :precondition (and (pain ?v1) (province ?v2))
    :effect (and (not (pain ?v1)) (not (province ?v2)) (harmony) (province ?v1) (craves ?v1 ?v2))
  )
)