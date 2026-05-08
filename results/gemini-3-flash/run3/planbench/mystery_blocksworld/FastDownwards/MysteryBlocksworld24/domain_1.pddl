(define (domain mystery_blocksworld_24)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (craves ?x ?y - object)
    (harmony)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and 
      (not (province ?x)) 
      (not (planet ?x)) 
      (not (harmony)) 
      (pain ?x)
    )
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (pain ?x)
    :effect (and 
      (not (pain ?x)) 
      (province ?x) 
      (planet ?x) 
      (harmony)
    )
  )

  (:action overcome
    :parameters (?x ?y - object)
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
    :parameters (?x ?y - object)
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