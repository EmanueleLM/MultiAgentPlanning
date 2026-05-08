(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (province ?b - block)
    (planet ?b - block)
    (harmony)
    (pain ?b - block)
    (craves ?b1 ?b2 - block)
  )

  (:action attack
    :parameters (?b - block)
    :precondition (and (province ?b) (planet ?b) (harmony))
    :effect (and
      (pain ?b)
      (not (province ?b))
      (not (planet ?b))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?b - block)
    :precondition (pain ?b)
    :effect (and
      (province ?b)
      (planet ?b)
      (harmony)
      (not (pain ?b))
    )
  )

  (:action overcome
    :parameters (?b - block ?other - block)
    :precondition (and (province ?other) (pain ?b))
    :effect (and
      (harmony)
      (province ?b)
      (craves ?b ?other)
      (not (province ?other))
      (not (pain ?b))
    )
  )

  (:action feast
    :parameters (?b - block ?other - block)
    :precondition (and (craves ?b ?other) (province ?b) (harmony))
    :effect (and
      (pain ?b)
      (province ?other)
      (not (craves ?b ?other))
      (not (province ?b))
      (not (harmony))
    )
  )
)