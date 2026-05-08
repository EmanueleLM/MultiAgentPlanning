(define (domain mystery_blocksworld3)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?subject - object ?object - object)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x) (not (province ?x)) (not (planet ?x)) (not (harmony)))
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and (not (pain ?x)) (province ?x) (planet ?x) (harmony))
  )

  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and (province ?x) (pain ?y))
    :effect (and (not (province ?x)) (not (pain ?y)) (province ?y) (harmony) (craves ?y ?x))
  )

  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )
)