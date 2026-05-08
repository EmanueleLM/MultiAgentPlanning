(define (domain mystery_blocksworld_18)
  (:requirements :strips)
  (:predicates
    (craves ?v ?w)
    (province ?v)
    (planet ?v)
    (harmony)
    (pain ?v)
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

  (:action feast
    :parameters (?v ?w)
    :precondition (and (craves ?v ?w) (province ?v) (harmony))
    :effect (and
      (pain ?v)
      (province ?w)
      (not (craves ?v ?w))
      (not (province ?v))
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
    :parameters (?v ?w)
    :precondition (and (province ?w) (pain ?v))
    :effect (and
      (harmony)
      (province ?v)
      (craves ?v ?w)
      (not (province ?w))
      (not (pain ?v))
    )
  )
)