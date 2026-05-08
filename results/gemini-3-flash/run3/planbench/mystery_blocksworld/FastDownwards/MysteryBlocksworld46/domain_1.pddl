(define (domain mystery_blocksworld_46)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?x - object) ;; Equivalent to clear(?x)
    (planet ?x - object)   ;; Equivalent to ontable(?x)
    (pain ?x - object)     ;; Equivalent to holding(?x)
    (craves ?x ?y - object) ;; Equivalent to on(?x, ?y)
    (harmony)              ;; Equivalent to handempty
  )

  (:action attack
    :parameters (?obj - object)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and (pain ?obj)
                 (not (province ?obj))
                 (not (planet ?obj))
                 (not (harmony)))
  )

  (:action succumb
    :parameters (?obj - object)
    :precondition (pain ?obj)
    :effect (and (province ?obj)
                 (planet ?obj)
                 (harmony)
                 (not (pain ?obj)))
  )

  (:action overcome
    :parameters (?obj ?other - object)
    :precondition (and (province ?other) (pain ?obj))
    :effect (and (harmony)
                 (province ?obj)
                 (craves ?obj ?other)
                 (not (province ?other))
                 (not (pain ?obj)))
  )

  (:action feast
    :parameters (?obj ?other - object)
    :precondition (and (craves ?obj ?other) (province ?obj) (harmony))
    :effect (and (pain ?obj)
                 (province ?other)
                 (not (craves ?obj ?other))
                 (not (province ?obj))
                 (not (harmony)))
  )
)