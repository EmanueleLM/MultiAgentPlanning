(define (domain mystery_blocksworld_30)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?v0 - object)
    (planet ?v0 - object)
    (pain ?v0 - object)
    (harmony)
    (craves ?v0 ?v1 - object)
  )

  (:action attack
    :parameters (?v0 - object)
    :precondition (and (province ?v0) (planet ?v0) (harmony))
    :effect (and
      (pain ?v0)
      (not (province ?v0))
      (not (planet ?v0))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?v0 - object)
    :precondition (pain ?v0)
    :effect (and
      (province ?v0)
      (planet ?v0)
      (harmony)
      (not (pain ?v0))
    )
  )

  (:action overcome
    :parameters (?v0 - object ?v1 - object)
    :precondition (and (province ?v1) (pain ?v0))
    :effect (and
      (harmony)
      (province ?v0)
      (craves ?v0 ?v1)
      (not (province ?v1))
      (not (pain ?v0))
    )
  )

  (:action feast
    :parameters (?v0 - object ?v1 - object)
    :precondition (and (craves ?v0 ?v1) (province ?v0) (harmony))
    :effect (and
      (pain ?v0)
      (province ?v1)
      (not (craves ?v0 ?v1))
      (not (province ?v0))
      (not (harmony))
    )
  )
)