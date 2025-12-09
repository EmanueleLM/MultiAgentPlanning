(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object phase)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?o1 - object ?o2 - object)
    (harmony)
    (pain)
    (attacked ?o - object ?pl - object)
    (phase ?p - phase)
    (phase-successor ?p1 - phase ?p2 - phase)
    (current-phase ?p - phase)
  )

  (:action attacker-attack
    :parameters (?att - object ?pl - object ?ph - phase ?ph-next - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-successor ?ph ?ph-next)
      (province ?att)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain)
      (attacked ?att ?pl)
      (not (province ?att))
      (not (planet ?pl))
      (not (harmony))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )

  (:action attacker-succumb
    :parameters (?att - object ?pl - object ?ph - phase ?ph-next - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-successor ?ph ?ph-next)
      (pain)
      (attacked ?att ?pl)
    )
    :effect (and
      (province ?att)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (attacked ?att ?pl))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )

  (:action overcomer-overcome
    :parameters (?obj - object ?other - object ?ph - phase ?ph-next - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-successor ?ph ?ph-next)
      (province ?other)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )

  (:action feeder-feast
    :parameters (?obj - object ?other - object ?ph - phase ?ph-next - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-successor ?ph ?ph-next)
      (craves ?obj ?other)
      (province ?obj)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?obj ?other))
      (not (province ?obj))
      (not (harmony))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )
)