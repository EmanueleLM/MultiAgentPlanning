(define (domain mystery_blocksworld)
  (:requirements :strips)
  (:predicates
    (province ?x)
    (planet ?x)
    (harmony)
    (pain ?x)
    (craves ?x ?y)
  )

  (:action attack
    :parameters (?obj)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and 
      (not (province ?obj)) 
      (not (planet ?obj)) 
      (not (harmony)) 
      (pain ?obj)
    )
  )

  (:action succumb
    :parameters (?obj)
    :precondition (pain ?obj)
    :effect (and 
      (not (pain ?obj)) 
      (province ?obj) 
      (planet ?obj) 
      (harmony)
    )
  )

  (:action feast
    :parameters (?obj ?other)
    :precondition (and (province ?obj) (craves ?obj ?other) (harmony))
    :effect (and 
      (not (province ?obj)) 
      (not (craves ?obj ?other)) 
      (not (harmony)) 
      (pain ?obj) 
      (province ?other)
    )
  )

  (:action overcome
    :parameters (?obj ?other)
    :precondition (and (pain ?obj) (province ?other))
    :effect (and 
      (not (pain ?obj)) 
      (not (province ?other)) 
      (province ?obj) 
      (craves ?obj ?other) 
      (harmony)
    )
  )
)