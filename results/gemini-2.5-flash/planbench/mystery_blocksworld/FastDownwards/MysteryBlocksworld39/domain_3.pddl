(define (domain mystery_blocksworld39)
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
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (pain ?o)
    )
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (pain ?o)
    :effect (and
      (not (pain ?o))
      (province ?o)
      (planet ?o)
      (harmony)
    )
  )

  (:action overcome
    :parameters (?o - object ?other_o - object)
    :precondition (and
      (province ?other_o)
      (pain ?o)
    )
    :effect (and
      (not (province ?other_o))
      (not (pain ?o))
      (harmony)
      (province ?o)
      (craves ?o ?other_o)
    )
  )

  (:action feast
    :parameters (?o - object ?other_o - object)
    :precondition (and
      (craves ?o ?other_o)
      (province ?o)
      (harmony)
    )
    :effect (and
      (not (craves ?o ?other_o))
      (not (province ?o))
      (not (harmony))
      (pain ?o)
      (province ?other_o)
    )
  )
)