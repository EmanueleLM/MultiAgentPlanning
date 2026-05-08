(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?v)
    (planet ?v)
    (pain ?v)
    (craves ?v1 ?v2)
    (harmony)
  )

  (:action attack
    :parameters (?v - object)
    :precondition (and (province ?v) (planet ?v) (harmony))
    :effect (and 
      (pain ?v) 
      (not (province ?v)) 
      (not (planet ?v)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?v - object)
    :precondition (pain ?v)
    :effect (and 
      (province ?v) 
      (planet ?v) 
      (harmony) 
      (not (pain ?v))
    )
  )

  (:action feast
    :parameters (?v1 ?v2 - object)
    :precondition (and (craves ?v1 ?v2) (province ?v1) (harmony))
    :effect (and 
      (pain ?v1) 
      (province ?v2) 
      (not (craves ?v1 ?v2)) 
      (not (province ?v1)) 
      (not (harmony))
    )
  )

  (:action overcome
    :parameters (?v1 ?v2 - object)
    :precondition (and (province ?v2) (pain ?v1))
    :effect (and 
      (harmony) 
      (province ?v1) 
      (craves ?v1 ?v2) 
      (not (province ?v2)) 
      (not (pain ?v1))
    )
  )
)