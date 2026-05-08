(define (domain mystery_blocksworld_2)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (pain ?x)
    (craves ?x ?y)
    (harmony)
  )

  (:action attack
    :parameters (?x)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and 
      (pain ?x) 
      (not (province ?x)) 
      (not (planet ?x)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x)
    :precondition (pain ?x)
    :effect (and 
      (province ?x) 
      (planet ?x) 
      (harmony) 
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x ?y)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and 
      (pain ?x) 
      (province ?y) 
      (not (craves ?x ?y)) 
      (not (province ?x)) 
      (not (harmony))
    )
  )

  (:action overcome
    :parameters (?x ?y)
    :precondition (and (pain ?x) (province ?y))
    :effect (and 
      (craves ?x ?y) 
      (province ?x) 
      (harmony) 
      (not (pain ?x)) 
      (not (province ?y))
    )
  )
)