(define (domain spiritual_transitions)
  (:requirements :strips :typing)
  (:types entity)
  (:predicates
    (province ?e - entity)
    (planet ?e - entity)
    (pain ?e - entity)
    (craves ?e1 ?e2 - entity)
    (harmony)
  )

  (:action attack
    :parameters (?o - entity)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and (pain ?o) (not (province ?o)) (not (planet ?o)) (not (harmony)))
  )

  (:action succumb
    :parameters (?o - entity)
    :precondition (and (pain ?o))
    :effect (and (province ?o) (planet ?o) (harmony) (not (pain ?o)))
  )

  (:action overcome
    :parameters (?obj ?other - entity)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and (harmony) (province ?obj) (craves ?obj ?other) (not (province ?other)) (not (pain ?obj)))
  )

  (:action feast
    :parameters (?obj ?other - entity)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (pain ?obj) (province ?other) (not (craves ?obj ?other)) (not (province ?obj)) (not (harmony)))
  )
)