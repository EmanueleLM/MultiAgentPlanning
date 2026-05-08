(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types element)
  (:predicates
    (province ?v - element)
    (planet ?v - element)
    (harmony)
    (pain ?v - element)
    (craves ?v1 ?v2 - element)
  )

  (:action attack
    :parameters (?v1 - element)
    :precondition (and (province ?v1) (planet ?v1) (harmony))
    :effect (and (not (province ?v1)) (not (planet ?v1)) (not (harmony)) (pain ?v1))
  )

  (:action succumb
    :parameters (?v1 - element)
    :precondition (pain ?v1)
    :effect (and (not (pain ?v1)) (province ?v1) (planet ?v1) (harmony))
  )

  (:action overcome
    :parameters (?v1 ?v2 - element)
    :precondition (and (pain ?v1) (province ?v2))
    :effect (and (not (pain ?v1)) (not (province ?v2)) (province ?v1) (harmony) (craves ?v1 ?v2))
  )

  (:action feast
    :parameters (?v1 ?v2 - element)
    :precondition (and (province ?v1) (harmony) (craves ?v1 ?v2))
    :effect (and (not (province ?v1)) (not (harmony)) (not (craves ?v1 ?v2)) (pain ?v1) (province ?v2))
  )
)