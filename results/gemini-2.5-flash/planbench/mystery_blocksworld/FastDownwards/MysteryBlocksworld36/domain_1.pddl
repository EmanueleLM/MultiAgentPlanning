(define (domain mystery_blocksworld36)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  (:action attack
    :parameters (?obj - object)
    :precondition (and
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
    :effect (and
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
      (pain ?obj)
    )
  )

  (:action succumb
    :parameters (?obj - object)
    :precondition (and
      (pain ?obj)
    )
    :effect (and
      (not (pain ?obj))
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?obj1 - object ?obj2 - object)
    :precondition (and
      (province ?obj2)
      (pain ?obj1)
    )
    :effect (and
      (not (province ?obj2))
      (not (pain ?obj1))
      (harmony)
      (province ?obj1)
      (craves ?obj1 ?obj2)
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
      (not (craves ?obj1 ?obj2))
      (not (province ?obj1))
      (not (harmony))
      (pain ?obj1)
      (province ?obj2)
    )
  )
)