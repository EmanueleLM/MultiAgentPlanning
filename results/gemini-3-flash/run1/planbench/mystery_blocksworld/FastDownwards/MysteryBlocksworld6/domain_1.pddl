(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types item)
  (:predicates
    (province ?x - item)
    (planet ?x - item)
    (pain ?x - item)
    (craves ?x ?y - item)
    (harmony)
  )

  (:action attack
    :parameters (?x - item)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x) (not (province ?x)) (not (planet ?x)) (not (harmony)))
  )

  (:action succumb
    :parameters (?x - item)
    :precondition (pain ?x)
    :effect (and (province ?x) (planet ?x) (harmony) (not (pain ?x)))
  )

  (:action overcome
    :parameters (?x ?y - item)
    :precondition (and (pain ?x) (province ?y))
    :effect (and (harmony) (province ?x) (craves ?x ?y) (not (pain ?x)) (not (province ?y)))
  )

  (:action feast
    :parameters (?x ?y - item)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )
)