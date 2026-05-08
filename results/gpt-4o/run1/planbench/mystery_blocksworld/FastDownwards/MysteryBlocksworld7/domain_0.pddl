(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object_type)
  (:predicates
    (province ?x - object_type)
    (planet ?x - object_type)
    (pain ?x - object_type)
    (harmony)
    (craves ?x - object_type ?y - object_type)
  )
  
  (:action attack
    :parameters (?x - object_type)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x) (not (province ?x)) (not (harmony)))
  )
  
  (:action succumb
    :parameters (?x - object_type)
    :precondition (pain ?x)
    :effect (and (province ?x) (planet ?x) (harmony) (not (pain ?x)))
  )
  
  (:action overcome
    :parameters (?x - object_type ?y - object_type)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (harmony) (province ?x) (craves ?x ?y) (not (province ?y)) (not (pain ?x)))
  )
  
  (:action feast
    :parameters (?x - object_type ?y - object_type)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x) (province ?y) (not (craves ?x ?y)) (not (province ?x)) (not (harmony)))
  )
)