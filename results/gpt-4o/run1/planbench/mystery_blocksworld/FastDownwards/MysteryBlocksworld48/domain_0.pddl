(define (domain object_transitions)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates 
    (pain ?o - object)
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (object_craves ?craver - object ?craved - object)
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
    :effect (and (harmony) (province ?o) (object_craves ?o ?other) (not (province ?other)) (not (pain ?o)))
  )

  (:action feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and (object_craves ?o1 ?o2) (province ?o1) (harmony))
    :effect (and (pain ?o1) (province ?o2) (not (object_craves ?o1 ?o2)) (not (province ?o1)) (not (harmony)))
  )
)