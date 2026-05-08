(define (domain mystery_blocksworld_13)
  (:requirements :strips)
  (:predicates
    (province ?o)
    (planet ?o)
    (pain ?o)
    (harmony)
    (craves ?o1 ?o2)
  )

  (:action attack
    :parameters (?o)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and 
      (pain ?o) 
      (not (province ?o)) 
      (not (planet ?o)) 
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o)
    :precondition (pain ?o)
    :effect (and 
      (province ?o) 
      (planet ?o) 
      (harmony) 
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?o ?other)
    :precondition (and (province ?other) (pain ?o))
    :effect (and 
      (harmony) 
      (province ?o) 
      (craves ?o ?other) 
      (not (province ?other)) 
      (not (pain ?o))
    )
  )

  (:action feast
    :parameters (?o ?other)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and 
      (pain ?o) 
      (province ?other) 
      (not (craves ?o ?other)) 
      (not (province ?o)) 
      (not (harmony))
    )
  )
)