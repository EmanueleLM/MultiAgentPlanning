(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?o1 ?o2 - obj)
    (harmony)
    (planet ?o - obj)
    (province ?o - obj)
    (pain ?o - obj)
  )

  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and (not (province ?o)) (not (planet ?o)) (not (harmony)) (pain ?o))
  )

  (:action succumb
    :parameters (?o - obj)
    :precondition (pain ?o)
    :effect (and (not (pain ?o)) (province ?o) (planet ?o) (harmony))
  )

  (:action overcome
    :parameters (?o ?other - obj)
    :precondition (and (pain ?o) (province ?other))
    :effect (and (not (pain ?o)) (not (province ?other)) (craves ?o ?other) (province ?o) (harmony))
  )

  (:action feast
    :parameters (?o ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and (not (craves ?o ?other)) (not (province ?o)) (not (harmony)) (pain ?o) (province ?other))
  )
)