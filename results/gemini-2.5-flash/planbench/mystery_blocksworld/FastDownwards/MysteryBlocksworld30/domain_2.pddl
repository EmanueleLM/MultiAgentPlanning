(define (domain mystery_blocksworld30)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?obj - object)
    (planet ?obj - object)
    (harmony)
    (pain ?obj - object)
    (craves ?obj1 - object ?obj2 - object)
  )

  (:action attack
    :parameters (?obj - object)
    :precondition (and
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj - object)
    :precondition (and
      (pain ?obj)
    )
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj1 - object ?obj2 - object)
    :precondition (and
      (province ?obj2)
      (pain ?obj1)
    )
    :effect (and
      (harmony)
      (province ?obj1)
      (craves ?obj1 ?obj2)
      (not (province ?obj2))
      (not (pain ?obj1))
    )
  )

  (:action feast
    :parameters (?obj1 - object ?obj2 - object)
    :precondition (and
      (craves ?obj1 ?obj2)
      (province ?obj1)
      (harmony)
    )
    :effect (and
      (pain ?obj1)
      (province ?obj2)
      (not (craves ?obj1 ?obj2))
      (not (province ?obj1))
      (not (harmony))
    )
  )
)