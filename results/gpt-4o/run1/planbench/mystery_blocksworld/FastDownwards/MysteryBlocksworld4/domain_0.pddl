(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object_type)
  (:predicates 
    (province ?obj - object_type)
    (planet ?obj - object_type)
    (harmony)
    (pain ?obj - object_type)
    (craves ?obj1 ?obj2 - object_type))
  
  (:action attack
    :parameters (?obj - object_type)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and (pain ?obj)
                 (not (province ?obj))
                 (not (planet ?obj))
                 (not (harmony))))
                 
  (:action succumb
    :parameters (?obj - object_type)
    :precondition (pain ?obj)
    :effect (and (province ?obj)
                 (planet ?obj)
                 (harmony)
                 (not (pain ?obj))))
                 
  (:action overcome
    :parameters (?obj ?other_obj - object_type)
    :precondition (and (province ?other_obj) (pain ?obj))
    :effect (and (harmony)
                 (province ?obj)
                 (craves ?obj ?other_obj)
                 (not (province ?other_obj))
                 (not (pain ?obj))))
                 
  (:action feast
    :parameters (?obj1 ?obj2 - object_type)
    :precondition (and (craves ?obj1 ?obj2) (province ?obj1) (harmony))
    :effect (and (pain ?obj1)
                 (province ?obj2)
                 (not (craves ?obj1 ?obj2))
                 (not (province ?obj1))
                 (not (harmony))))
)