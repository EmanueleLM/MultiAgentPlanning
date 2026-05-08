(define (domain mystery_blocksworld_25)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (planet ?x - obj)
    (province ?x - obj)
    (craves ?x ?y - obj)
    (pain ?x - obj)
    (harmony)
  )

  (:action attack
    :parameters (?v1 - obj)
    :precondition (and (province ?v1) (planet ?v1) (harmony))
    :effect (and 
      (not (province ?v1)) 
      (not (planet ?v1)) 
      (not (harmony)) 
      (pain ?v1)
    )
  )

  (:action succumb
    :parameters (?v1 - obj)
    :precondition (pain ?v1)
    :effect (and 
      (not (pain ?v1)) 
      (province ?v1) 
      (planet ?v1) 
      (harmony)
    )
  )

  (:action overcome
    :parameters (?v1 ?v2 - obj)
    :precondition (and (pain ?v1) (province ?v2))
    :effect (and 
      (not (pain ?v1)) 
      (not (province ?v2)) 
      (harmony) 
      (province ?v1) 
      (craves ?v1 ?v2)
    )
  )

  (:action feast
    :parameters (?v1 ?v2 - obj)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and 
      (not (craves ?v1 ?v2)) 
      (not (province ?v1)) 
      (not (harmony)) 
      (pain ?v1) 
      (province ?v2)
    )
  )
)