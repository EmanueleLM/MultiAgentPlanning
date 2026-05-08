(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (craves ?x - object ?y - object)
    (harmony)
    (planet ?x - object)
    (province ?x - object)
    (pain ?x - object)
  )

  (:action Attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x) (not (province ?x)) (not (planet ?x)) (not (harmony)))
  )

  (:action Succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and (province ?x) (planet ?x) (harmony) (not (pain ?x)))
  )

  (:action Overcome
    :parameters (?x - object ?y - object)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (harmony) (province ?x) (craves ?x ?y) (not (province ?y)) (not (pain ?x)))
  )

  (:action Feast
    :parameters (?x - object ?y - object)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )
)