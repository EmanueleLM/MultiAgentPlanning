(define (domain mystery_blocksworld_3)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (province ?x - thing)
    (planet ?x - thing)
    (pain ?x - thing)
    (harmony)
    (craves ?x ?y - thing)
  )

  (:action attack
    :parameters (?x - thing)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and 
      (pain ?x) 
      (not (province ?x)) 
      (not (planet ?x)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - thing)
    :precondition (pain ?x)
    :effect (and 
      (province ?x) 
      (planet ?x) 
      (harmony) 
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x ?y - thing)
    :precondition (and (province ?y) (pain ?x))
    :effect (and 
      (harmony) 
      (province ?x) 
      (craves ?x ?y) 
      (not (province ?y)) 
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x ?y - thing)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and 
      (pain ?x) 
      (province ?y) 
      (not (craves ?x ?y)) 
      (not (province ?x)) 
      (not (harmony))
    )
  )
)