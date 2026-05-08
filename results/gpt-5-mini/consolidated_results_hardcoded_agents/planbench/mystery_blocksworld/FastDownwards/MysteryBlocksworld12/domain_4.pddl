(define (domain mysteryblocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity phase)

  (:predicates
    (craves ?x - entity ?y - entity)
    (province ?x - entity)
    (planet ?x - entity)
    (harmony)
    (pain ?x - entity)
    (current ?p - phase)
    (next ?p - phase ?q - phase)
  )

  (:action attacker-attack
    :parameters (?o - entity ?p - phase ?q - phase)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
              (not (current ?p))
              (current ?q)
            )
  )

  (:action feaster-feast
    :parameters (?o - entity ?other - entity ?p - phase ?q - phase)
    :precondition (and
                    (craves ?o ?other)
                    (province ?o)
                    (harmony)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (pain ?o)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
              (not (current ?p))
              (current ?q)
            )
  )

  (:action succumber-succumb
    :parameters (?o - entity ?p - phase ?q - phase)
    :precondition (and
                    (pain ?o)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
              (not (current ?p))
              (current ?q)
            )
  )

  (:action overcomer-overcome
    :parameters (?o - entity ?other - entity ?p - phase ?q - phase)
    :precondition (and
                    (province ?other)
                    (pain ?o)
                    (current ?p)
                    (next ?p ?q)
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
              (not (current ?p))
              (current ?q)
            )
  )
)