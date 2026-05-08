(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?obj - object)
    (planet ?obj - object)
    (harmony)
    (pain ?obj - object)
    (craves ?obj1 - object ?obj2 - object) 
  )
  
  (:action attack
    :parameters (?obj - object)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and (not (province ?obj)) (pain ?obj) (not (planet ?obj)) (not (harmony)))
  )
  
  (:action succumb
    :parameters (?obj - object)
    :precondition (pain ?obj)
    :effect (and (not (pain ?obj)) (province ?obj) (planet ?obj) (harmony))
  )
  
  (:action overcome
    :parameters (?obj - object ?other - object)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and (not (province ?other)) (not (pain ?obj)) (harmony) (province ?obj) (craves ?obj ?other))
  )
  
  (:action feast
    :parameters (?obj - object ?other - object)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (not (craves ?obj ?other)) (not (province ?obj)) (not (harmony)) (province ?other) (pain ?obj))
  )
)