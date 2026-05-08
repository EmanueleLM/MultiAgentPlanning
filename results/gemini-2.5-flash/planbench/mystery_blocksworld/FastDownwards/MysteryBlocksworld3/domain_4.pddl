(define (domain mystery_blocksworld3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (object_craves ?o1 - obj ?o2 - obj)
  )

  (:action attack
    :parameters (?object - obj)
    :precondition (and
      (province ?object)
      (planet ?object)
      (harmony)
    )
    :effect (and
      (pain ?object)
      (not (province ?object))
      (not (planet ?object))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?object - obj)
    :precondition (pain ?object)
    :effect (and
      (province ?object)
      (planet ?object)
      (harmony)
      (not (pain ?object))
    )
  )

  (:action overcome
    :parameters (?object - obj ?other_object - obj)
    :precondition (and
      (province ?other_object)
      (pain ?object)
    )
    :effect (and
      (harmony)
      (province ?object)
      (object_craves ?object ?other_object)
      (not (province ?other_object))
      (not (pain ?object))
    )
  )

  (:action feast
    :parameters (?object - obj ?other_object - obj)
    :precondition (and
      (object_craves ?object ?other_object)
      (province ?object)
      (harmony)
    )
    :effect (and
      (pain ?object)
      (province ?other_object)
      (not (object_craves ?object ?other_object))
      (not (province ?object))
      (not (harmony))
    )
  )