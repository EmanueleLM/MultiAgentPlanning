(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (object_craves ?x ?y - object)
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
    :parameters (?x ?y - object)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (not (province ?y)) (not (pain ?x)) (harmony) (province ?x) (object_craves ?x ?y))
  )

  (:action feast
    :parameters (?x ?y - object)
    :precondition (and (object_craves ?y ?x) (province ?x) (harmony))
    :effect (and (not (object_craves ?y ?x)) (not (province ?x)) (not (harmony)) (pain ?x) (province ?y))
  )
)