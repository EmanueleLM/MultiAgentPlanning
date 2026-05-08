(define (domain mystery_blocksworld_46)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?v1 ?v2 - obj)
    (harmony)
    (pain ?v1 - obj)
    (planet ?v1 - obj)
    (province ?v1 - obj)
  )

  (:action attack
    :parameters (?v1 - obj)
    :precondition (and (province ?v1) (planet ?v1) (harmony))
    :effect (and (pain ?v1) (not (province ?v1)) (not (planet ?v1)) (not (harmony)))
  )

  (:action succumb
    :parameters (?v1 - obj)
    :precondition (pain ?v1)
    :effect (and (harmony) (province ?v1) (planet ?v1) (not (pain ?v1)))
  )

  (:action overcome
    :parameters (?v1 ?v2 - obj)
    :precondition (and (pain ?v1) (province ?v2))
    :effect (and (harmony) (province ?v1) (craves ?v1 ?v2) (not (pain ?v1)) (not (province ?v2)))
  )

  (:action feast
    :parameters (?v1 ?v2 - obj)
    :precondition (and (harmony) (craves ?v1 ?v2) (province ?v1))
    :effect (and (pain ?v1) (province ?v2) (not (harmony)) (not (craves ?v1 ?v2)) (not (province ?v1)))
  )
)