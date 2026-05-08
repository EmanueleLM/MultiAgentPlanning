(define (domain mystery_blocksworld_41)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?o1 ?o2 - obj)
    (harmony)
  )

  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and 
      (not (province ?o)) 
      (not (planet ?o)) 
      (not (harmony)) 
      (pain ?o)
    )
  )

  (:action succumb
    :parameters (?o - obj)
    :precondition (pain ?o)
    :effect (and 
      (not (pain ?o)) 
      (province ?o) 
      (planet ?o) 
      (harmony)
    )
  )

  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (pain ?o) (province ?other))
    :effect (and 
      (not (pain ?o)) 
      (not (province ?other)) 
      (province ?o) 
      (craves ?o ?other) 
      (harmony)
    )
  )

  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?o) (craves ?o ?other) (harmony))
    :effect (and 
      (not (province ?o)) 
      (not (craves ?o ?other)) 
      (not (harmony)) 
      (pain ?o) 
      (province ?other)
    )
  )
)