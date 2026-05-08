(define (domain jack_of_all_trades)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    object
  )

  (:predicates
    (craves ?obj1 - object ?obj2 - object)
    (harmony)
    (planet ?obj - object)
    (province ?obj - object)
    (pain ?obj - object)
  )

  (:action attack
    :parameters (?obj - object)
    :precondition (and (province ?obj) (harmony) (exists (?x - object) (planet ?x)))
    :effect (and 
      (pain ?obj)
      (not (province ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj - object)
    :precondition (pain ?obj)
    :effect (and 
      (province ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj1 - object ?obj2 - object)
    :precondition (and (province ?obj2) (pain ?obj1))
    :effect (and 
      (harmony)
      (province ?obj1)
      (craves ?obj1 ?obj2)
      (not (province ?obj2))
      (not (pain ?obj1))
    )
  )

  (:action feast
    :parameters (?obj1 - object ?obj2 - object)
    :precondition (and (craves ?obj1 ?obj2) (province ?obj1) (harmony))
    :effect (and 
      (pain ?obj1)
      (province ?obj2)
      (not (craves ?obj1 ?obj2))
      (not (province ?obj1))
      (not (harmony))
    )
  )

)