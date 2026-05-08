(define (domain jack_of_all_trades)
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
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (not (province ?x)) (not (planet ?x)) (not (harmony)) (pain ?x))
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and (not (pain ?x)) (province ?x) (planet ?x) (harmony))
  )

  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (not (province ?y)) (not (pain ?x)) (harmony) (province ?x) (craves ?x ?y))
  )

  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (not (craves ?x ?y)) (not (province ?x)) (not (harmony)) (pain ?x) (province ?y))
  )
)