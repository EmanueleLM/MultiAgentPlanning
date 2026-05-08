(define (domain object_management)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x - object ?y - object)
  )

  (:action attack
    :parameters (?obj - object)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and (pain ?obj)
                 (not (province ?obj))
                 (not (planet ?obj))
                 (not (harmony)))
  )

  (:action succumb
    :parameters (?obj - object)
    :precondition (and (pain ?obj))
    :effect (and (province ?obj)
                 (planet ?obj)
                 (harmony)
                 (not (pain ?obj)))
  )

  (:action overcome
    :parameters (?obj - object ?other - object)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and (harmony)
                 (province ?obj)
                 (craves ?obj ?other)
                 (not (province ?other))
                 (not (pain ?obj)))
  )

  (:action feast
    :parameters (?obj - object ?other - object)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (pain ?obj)
                 (province ?other)
                 (not (craves ?obj ?other))
                 (not (province ?obj))
                 (not (harmony)))
  )
)