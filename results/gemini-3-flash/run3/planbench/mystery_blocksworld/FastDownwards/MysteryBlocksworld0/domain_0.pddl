(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types entity)
  (:predicates
    (province ?o - entity)
    (planet ?o - entity)
    (pain ?o - entity)
    (craves ?o1 ?o2 - entity)
    (harmony)
  )

  (:action attack
    :parameters (?o - entity)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - entity)
    :precondition (pain ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?o - entity ?other - entity)
    :precondition (and (province ?other) (pain ?o))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  (:action feast
    :parameters (?o - entity ?other - entity)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)