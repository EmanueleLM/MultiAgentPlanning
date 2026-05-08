(define (domain mystery_blocksworld_49)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (province ?o)
    (planet ?o)
    (harmony)
    (pain ?o)
    (craves ?o ?other)
  )

  (:action attack
    :parameters (?o)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and (pain ?o) (not (province ?o)) (not (planet ?o)) (not (harmony)))
  )

  (:action succumb
    :parameters (?o)
    :precondition (pain ?o)
    :effect (and (province ?o) (planet ?o) (harmony) (not (pain ?o)))
  )

  (:action overcome
    :parameters (?o ?other)
    :precondition (and (pain ?o) (province ?other))
    :effect (and (harmony) (province ?o) (craves ?o ?other) (not (province ?other)) (not (pain ?o)))
  )

  (:action feast
    :parameters (?o ?other)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and (pain ?o) (province ?other) (not (craves ?o ?other)) (not (province ?o)) (not (harmony)))
  )
)