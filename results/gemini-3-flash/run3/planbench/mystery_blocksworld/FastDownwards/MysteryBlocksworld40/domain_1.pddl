(define (domain mystery_blocksworld_40)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj)   ;; represents 'clear' in blocksworld
    (planet ?x - obj)     ;; represents 'ontable' in blocksworld
    (harmony)             ;; represents 'handempty' in blocksworld
    (pain ?x - obj)       ;; represents 'holding' in blocksworld
    (craves ?x ?y - obj)  ;; represents 'on' (x is on y) in blocksworld
  )

  ;; The 'attack' action corresponds to 'pickup' in blocksworld.
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

  ;; The 'succumb' action corresponds to 'putdown' in blocksworld.
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

  ;; The 'overcome' action corresponds to 'stack' in blocksworld.
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

  ;; The 'feast' action corresponds to 'unstack' in blocksworld.
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