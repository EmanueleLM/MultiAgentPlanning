(define (domain mystery_blocksworld_2)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x ?y - obj)
  )

  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and 
      (pain ?x) 
      (not (province ?x)) 
      (not (planet ?x)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and 
      (province ?x) 
      (planet ?x) 
      (harmony) 
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x - obj ?y - obj)
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
    :parameters (?x - obj ?y - obj)
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