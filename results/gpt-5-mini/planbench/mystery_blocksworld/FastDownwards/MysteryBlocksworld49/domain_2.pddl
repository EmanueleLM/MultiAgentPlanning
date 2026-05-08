(define (domain mystery_blocksworld49)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types object)
  (:predicates
    (harmony)
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)
    (craves ?o - object ?p - object)
  )

  (:action attack
    :parameters (?o - object)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action feast
    :parameters (?o - object ?other - object)
    :precondition (and (not (= ?o ?other)) (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (and (pain ?o))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?o - object ?other - object)
    :precondition (and (not (= ?o ?other)) (province ?other) (pain ?o))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )
)