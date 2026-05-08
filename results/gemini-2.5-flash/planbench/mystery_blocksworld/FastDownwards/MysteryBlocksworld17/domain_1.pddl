(define (domain mystery_blocksworld17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
  )
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
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
            )
  )

  (:action overcome
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
                    (province ?o2) ; Province other object
                    (pain ?o1)    ; Pain object
                  )
    :effect (and
              (harmony)
              (province ?o1)      ; Province object
              (craves ?o1 ?o2)    ; Object Craves other object
              (not (province ?o2))
              (not (pain ?o1))
            )
  )

  (:action feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and
                    (craves ?o1 ?o2)
                    (province ?o1)
                    (harmony)
                  )
    :effect (and
              (pain ?o1)
              (province ?o2)
              (not (craves ?o1 ?o2))
              (not (province ?o1))
              (not (harmony))
            )
  )
)