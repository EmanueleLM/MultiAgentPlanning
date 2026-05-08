(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates 
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
  )

  (:action attack
    :parameters (?o - object)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and (pain ?o) (not (province ?o)) (not (planet ?o)) (not (harmony)))
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (pain ?o)
    :effect (and (province ?o) (planet ?o) (harmony) (not (pain ?o)))
  )

  (:action overcome
    :parameters (?o - object ?other - object)
    :precondition (and (province ?other) (pain ?o))
    :effect (and (harmony) (province ?o) (craves ?o ?other) (not (province ?other)) (not (pain ?o)))
  )

  (:action feast
    :parameters (?o - object ?other - object)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and (pain ?o) (province ?other) (not (craves ?o ?other)) (not (province ?o)) (not (harmony)))
  )
)