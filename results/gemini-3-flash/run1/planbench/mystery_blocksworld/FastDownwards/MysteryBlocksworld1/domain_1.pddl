(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (harmony)
    (craves ?x ?y - object)
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

  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )

  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and (pain ?x) (province ?y))
    :effect (and (harmony) (province ?x) (craves ?x ?y) (not (pain ?x)) (not (province ?y)))
  )
)