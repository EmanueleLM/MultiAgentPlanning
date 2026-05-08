(define (domain jack_of_all_trades)
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
    :parameters (?obj - entity)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and (pain ?obj) (not (province ?obj)) (not (planet ?obj)) (not (harmony)))
  )

  (:action succumb
    :parameters (?obj - entity)
    :precondition (pain ?obj)
    :effect (and (province ?obj) (planet ?obj) (harmony) (not (pain ?obj)))
  )

  (:action overcome
    :parameters (?obj - entity ?other - entity)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and (harmony) (province ?obj) (craves ?obj ?other) (not (province ?other)) (not (pain ?obj)))
  )

  (:action feast
    :parameters (?obj - entity ?other - entity)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (pain ?obj) (province ?other) (not (craves ?obj ?other)) (not (province ?obj)) (not (harmony)))
  )
)