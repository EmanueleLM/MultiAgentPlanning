(define (domain mystery_blocksworld_4)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?v - obj)
    (planet ?v - obj)
    (harmony)
    (pain ?v - obj)
    (craves ?v ?w - obj)
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
    :parameters (?v - obj ?w - obj)
    :precondition (and (craves ?v ?w) (province ?v) (harmony))
    :effect (and (not (craves ?v ?w)) (not (province ?v)) (not (harmony)) (pain ?v) (province ?w))
  )

  (:action overcome
    :parameters (?v - obj ?w - obj)
    :precondition (and (province ?w) (pain ?v))
    :effect (and (not (province ?w)) (not (pain ?v)) (harmony) (province ?v) (craves ?v ?w))
  )
)