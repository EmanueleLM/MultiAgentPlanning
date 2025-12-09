(define (domain mysteryblocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity phase)

  (:predicates
    (craves ?x - entity ?y - entity)
    (province ?x - entity)
    (planet ?x - entity)
    (harmony)
    (pain ?x - entity)
    (phase-ready ?p - phase)
    (phase-done ?p - phase)
    (next ?p - phase ?q - phase)
  )

  ;; Attack action: attacker produces pain on an object but consumes its province, planet and harmony.
  (:action attacker-attack
    :parameters (?o - entity ?ph - phase ?phs - phase)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                    (phase-ready ?ph)
                    (next ?ph ?phs)
                    (not (phase-done ?ph))
                  )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
              (phase-done ?ph)
              (not (phase-ready ?ph))
              (phase-ready ?phs)
            )
  )

  ;; Feast action: object feasts on another, producing pain on feeder and transferring province to the other.
  (:action feaster-feast
    :parameters (?o - entity ?other - entity ?ph - phase ?phs - phase)
    :precondition (and
                    (craves ?o ?other)
                    (province ?o)
                    (harmony)
                    (phase-ready ?ph)
                    (next ?ph ?phs)
                    (not (phase-done ?ph))
                  )
    :effect (and
              (pain ?o)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
              (phase-done ?ph)
              (not (phase-ready ?ph))
              (phase-ready ?phs)
            )
  )

  ;; Succumb action: an object that is in pain restores province, planet and harmony.
  (:action succumber-succumb
    :parameters (?o - entity ?ph - phase ?phs - phase)
    :precondition (and
                    (pain ?o)
                    (phase-ready ?ph)
                    (next ?ph ?phs)
                    (not (phase-done ?ph))
                  )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
              (phase-done ?ph)
              (not (phase-ready ?ph))
              (phase-ready ?phs)
            )
  )

  ;; Overcome action: with province on the other and current pain, produce harmony, own province, and a craving relation.
  (:action overcomer-overcome
    :parameters (?o - entity ?other - entity ?ph - phase ?phs - phase)
    :precondition (and
                    (province ?other)
                    (pain ?o)
                    (phase-ready ?ph)
                    (next ?ph ?phs)
                    (not (phase-done ?ph))
                  )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
              (phase-done ?ph)
              (not (phase-ready ?ph))
              (phase-ready ?phs)
            )
  )
)