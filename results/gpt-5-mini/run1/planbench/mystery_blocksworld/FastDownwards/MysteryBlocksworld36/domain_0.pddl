(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)
    (craves ?from - object ?to - object)
    (harmony)
  )

  ;; Attack action
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

  ;; Succumb action
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

  ;; Overcome action
  (:action overcome
    :parameters (?obj - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?obj)
    )
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
    )
  )

  ;; Feast action
  (:action feast
    :parameters (?obj - object ?other - object)
    :precondition (and
      (craves ?obj ?other)
      (province ?obj)
      (harmony)
    )
    :effect (and
      (pain ?obj)
      (province ?other)
      (not (craves ?obj ?other))
      (not (province ?obj))
      (not (harmony))
    )
  )
)