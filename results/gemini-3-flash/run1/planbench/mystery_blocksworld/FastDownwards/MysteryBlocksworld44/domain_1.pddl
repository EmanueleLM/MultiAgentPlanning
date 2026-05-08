(define (domain mystery_blocksworld_44)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?x - obj) ;; clear
    (planet ?x - obj)   ;; on-table
    (pain ?x - obj)     ;; holding
    (craves ?x ?y - obj) ;; x is on y
    (harmony)           ;; hand-empty
  )

  (:action attack
    :parameters (?obj - obj)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and 
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?obj - obj)
    :precondition (pain ?obj)
    :effect (and 
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  (:action overcome
    :parameters (?obj - obj ?other - obj)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and 
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
    )
  )

  (:action feast
    :parameters (?obj - obj ?other - obj)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and 
      (pain ?obj)
      (province ?other)
      (not (craves ?obj ?other))
      (not (province ?obj))
      (not (harmony))
    )
  )
)