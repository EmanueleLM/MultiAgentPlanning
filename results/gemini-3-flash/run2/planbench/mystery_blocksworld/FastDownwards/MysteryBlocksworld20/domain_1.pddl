(define (domain mystery_blocksworld)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (province ?x)
    (planet ?x)
    (pain ?x)
    (craves ?x ?y)
    (harmony)
  )

  (:action attack
    :parameters (?v)
    :precondition (and (province ?v) (planet ?v) (harmony))
    :effect (and
      (pain ?v)
      (not (province ?v))
      (not (planet ?v))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?v)
    :precondition (pain ?v)
    :effect (and
      (province ?v)
      (planet ?v)
      (harmony)
      (not (pain ?v))
    )
  )

  (:action overcome
    :parameters (?v ?other)
    :precondition (and (province ?other) (pain ?v))
    :effect (and
      (harmony)
      (province ?v)
      (craves ?v ?other)
      (not (province ?other))
      (not (pain ?v))
    )
  )

  (:action feast
    :parameters (?v ?other)
    :precondition (and (craves ?v ?other) (province ?v) (harmony))
    :effect (and
      (pain ?v)
      (province ?other)
      (not (craves ?v ?other))
      (not (province ?v))
      (not (harmony))
    )
  )
)