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
  
  (:action Attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and (pain ?x)
                 (not (province ?x))
                 (not (planet ?x))
                 (not (harmony)))
  )
  
  (:action Succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and (province ?x)
                 (planet ?x)
                 (harmony)
                 (not (pain ?x)))
  )
  
  (:action Overcome
    :parameters (?x ?y - object)
    :precondition (and (province ?y) (pain ?x))
    :effect (and (harmony)
                 (province ?x)
                 (object_craves ?x ?y)
                 (not (province ?y))
                 (not (pain ?x)))
  )
  
  (:action Feast
    :parameters (?x ?y - object)
    :precondition (and (object_craves ?x ?y) (province ?x) (harmony))
    :effect (and (pain ?x)
                 (province ?y)
                 (not (object_craves ?x ?y))
                 (not (province ?x))
                 (not (harmony)))
  )
)