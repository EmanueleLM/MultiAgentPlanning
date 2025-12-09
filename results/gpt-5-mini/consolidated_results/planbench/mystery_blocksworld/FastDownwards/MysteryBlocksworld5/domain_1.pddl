(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object phase)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?o1 - object ?o2 - object)
    (harmony)
    (pain)
    (phase ?p - phase)
    (phase-successor ?p1 - phase ?p2 - phase)
    (current-phase ?p - phase)
  )

  ;; Attacker's Attack: consumes a province and a planet and harmony, produces pain.
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
      (not (province ?att))
      (not (planet ?pl))
      (not (harmony))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )

  ;; Attacker's Succumb: requires pain; restores province, planet, harmony for a chosen object and clears pain.
  (:action attacker-succumb
    :parameters (?obj - object ?ph - phase ?ph-next - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-successor ?ph ?ph-next)
      (pain)
    )
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain))
      (not (current-phase ?ph))
      (current-phase ?ph-next)
    )
  )

  ;; Overcomer's Overcome: requires a province for the "other" object and pain;
  ;; produces harmony, gives province to ?obj, creates craves(?obj,?other), removes province of other and clears pain.
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

  ;; Feeder's Feast: consumes a craves relation, a province, and harmony; produces pain and gives province to the "other" object.
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