(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
  )

  (:action attacker-attack
    :parameters (?o - obj)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                  )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
            )
  )

  (:action succumber-succumb
    :parameters (?o - obj)
    :precondition (and
                    (pain ?o)
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
            )
  )

  (:action overcomer-overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
                    (province ?other)
                    (pain ?o)
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
            )
  )

  (:action feaster-feast
    :parameters (?craver - obj ?meal - obj)
    :precondition (and
                    (craves ?craver ?meal)
                    (province ?craver)
                    (harmony)
                  )
    :effect (and
              (pain ?craver)
              (province ?meal)
              (not (craves ?craver ?meal))
              (not (province ?craver))
              (not (harmony))
            )
  )
)