(define (domain struggle)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?other - obj)
    (harmony)
    (pain)
  )

  (:action attack
    :parameters (?p - obj ?pl - obj)
    :precondition (and (province ?p) (planet ?pl) (harmony))
    :effect (and
              (not (province ?p))
              (not (planet ?pl))
              (not (harmony))
              (pain))
  )

  (:action succumb
    :parameters (?p - obj ?pl - obj)
    :precondition (pain)
    :effect (and
              (not (pain))
              (harmony)
              (province ?p)
              (planet ?pl))
  )

  (:action overcome
    :parameters (?obj - obj ?other - obj)
    :precondition (and (province ?other) (pain))
    :effect (and
              (harmony)
              (province ?obj)
              (craves ?obj ?other)
              (not (province ?other))
              (not (pain)))
  )

  (:action feast
    :parameters (?a - obj ?b - obj)
    :precondition (and (craves ?a ?b) (province ?a) (harmony))
    :effect (and
              (pain)
              (province ?b)
              (not (craves ?a ?b))
              (not (province ?a))
              (not (harmony)))
  )
)