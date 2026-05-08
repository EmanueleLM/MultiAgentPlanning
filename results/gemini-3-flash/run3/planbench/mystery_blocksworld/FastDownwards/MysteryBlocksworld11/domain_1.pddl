(define (domain mystery_blocksworld_11)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (harmony)
    (craves ?x ?y - obj)
  )

  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and 
      (not (province ?x)) 
      (not (planet ?x)) 
      (not (harmony)) 
      (pain ?x)
    )
  )

  (:action succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and 
      (not (pain ?x)) 
      (province ?x) 
      (planet ?x) 
      (harmony)
    )
  )

  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and 
      (not (pain ?x)) 
      (not (province ?y)) 
      (harmony) 
      (province ?x) 
      (craves ?x ?y)
    )
  )

  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and 
      (not (craves ?x ?y)) 
      (not (province ?x)) 
      (not (harmony)) 
      (pain ?x) 
      (province ?y)
    )
  )
)