(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (craves ?x ?y - obj)
    (harmony)
  )

  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (not (province ?x)) (not (planet ?x)) (not (harmony)) (pain ?x))
  )

  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and (not (pain ?x)) (province ?x) (planet ?x) (harmony))
  )

  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and (not (pain ?x)) (not (province ?y)) (harmony) (province ?x) (craves ?x ?y))
  )

  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?x) (craves ?x ?y) (harmony))
    :effect (and (not (province ?x)) (not (craves ?x ?y)) (not (harmony)) (pain ?x) (province ?y))
  )
)