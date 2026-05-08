(define (domain mystery_blocksworld_46)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (craves ?x ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (harmony)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x) (not (province ?x)) (not (planet ?x)) (not (harmony)))
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and (province ?x) (planet ?x) (harmony) (not (pain ?x)))
  )

  (:action overcome
    :parameters (?x ?y - object)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (harmony) (province ?x) (craves ?x ?y) (not (province ?y)) (not (pain ?x)))
  )

  (:action feast
    :parameters (?x ?y - object)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )
)