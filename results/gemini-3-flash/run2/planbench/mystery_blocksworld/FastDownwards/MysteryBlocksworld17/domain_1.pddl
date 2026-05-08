(define (domain mystery_blocksworld_17)
  (:requirements :strips :typing)
  (:types
    obj
  )
  (:predicates
    (province ?v - obj)
    (planet ?v - obj)
    (pain ?v - obj)
    (craves ?v ?w - obj)
    (harmony)
  )

  (:action attack
    :parameters (?v - obj)
    :precondition (and (province ?v) (planet ?v) (harmony))
    :effect (and
      (pain ?v)
      (not (province ?v))
      (not (planet ?v))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?v - obj)
    :precondition (pain ?v)
    :effect (and
      (province ?v)
      (planet ?v)
      (harmony)
      (not (pain ?v))
    )
  )

  (:action overcome
    :parameters (?v - obj ?w - obj)
    :precondition (and (pain ?v) (province ?w))
    :effect (and
      (harmony)
      (province ?v)
      (craves ?v ?w)
      (not (province ?w))
      (not (pain ?v))
    )
  )

  (:action feast
    :parameters (?v - obj ?w - obj)
    :precondition (and (craves ?v ?w) (province ?v) (harmony))
    :effect (and
      (pain ?v)
      (province ?w)
      (not (craves ?v ?w))
      (not (province ?v))
      (not (harmony))
    )
  )
)