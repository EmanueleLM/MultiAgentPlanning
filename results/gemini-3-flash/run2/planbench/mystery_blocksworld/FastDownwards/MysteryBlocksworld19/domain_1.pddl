(define (domain mystery_blocksworld_19)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (craves ?x ?y - thing)
    (province ?x - thing)
    (planet ?x - thing)
    (pain ?x - thing)
    (harmony)
  )

  (:action attack
    :parameters (?obj - thing)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and 
      (pain ?obj) 
      (not (province ?obj)) 
      (not (planet ?obj)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj - thing)
    :precondition (pain ?obj)
    :effect (and 
      (province ?obj) 
      (planet ?obj) 
      (harmony) 
      (not (pain ?obj))
    )
  )

  (:action feast
    :parameters (?obj ?other - thing)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and 
      (pain ?obj) 
      (province ?other) 
      (not (craves ?obj ?other)) 
      (not (province ?obj)) 
      (not (harmony))
    )
  )

  (:action overcome
    :parameters (?obj ?other - thing)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and 
      (harmony) 
      (province ?obj) 
      (craves ?obj ?other) 
      (not (province ?other)) 
      (not (pain ?obj))
    )
  )
)