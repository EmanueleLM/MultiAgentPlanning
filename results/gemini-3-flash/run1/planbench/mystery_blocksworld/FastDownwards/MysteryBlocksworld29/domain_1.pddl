(define (domain mystery_blocksworld_29)
  (:requirements :strips)
  (:predicates
    (craves ?x ?y)
    (province ?x)
    (planet ?x)
    (pain ?x)
    (harmony)
  )

  (:action attack
    :parameters (?obj)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj)
    :precondition (pain ?obj)
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj ?other_obj)
    :precondition (and (province ?other_obj) (pain ?obj))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other_obj)
      (not (province ?other_obj))
      (not (pain ?obj))
    )
  )

  (:action feast
    :parameters (?obj ?other_obj)
    :precondition (and (craves ?obj ?other_obj) (province ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (province ?other_obj)
      (not (craves ?obj ?other_obj))
      (not (province ?obj))
      (not (harmony))
    )
  )
)