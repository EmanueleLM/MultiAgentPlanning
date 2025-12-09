(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object phase)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?o1 - object ?o2 - object)
    (harmony)
    (pain)
    ; Records which specific object and planet were removed by an Attack so Succumb
    ; can restore exactly those same objects.
    (attacked ?o - object ?pl - object)
    ; Explicit staged progression to enforce ordered, contiguous action execution.
    (phase ?p - phase)
    (phase-successor ?p1 - phase ?p2 - phase)
    (current-phase ?p - phase)
  )

  ; Attack: requires a specific province object, a specific planet object, and harmony.
  ; Produces pain and records the attacked pair; removes the province, the planet, and harmony.
  ; Advances to the successor phase to prevent immediate reversal within the same stage.
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

  ; Succumb: must reference the exact attacked pair produced by a prior Attack.
  ; Requires pain and that attacked pair; restores that province and planet and harmony,
  ; clears pain and the attacked record, and advances the phase.
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

  ; Overcome: needs a specific "other" object to have a province and requires pain.
  ; Produces harmony, gives province to the chosen object, and creates a craves relation
  ; from the chosen object to the other object. Removes the other's province and clears pain.
  ; Advances phase to enforce ordering.
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

  ; Feast: requires an explicit craves relation between two objects, a province for the craver,
  ; and harmony. Produces pain and transfers the province to the craved/other object.
  ; Removes the craves relation, the craver's province, and harmony. Advances phase.
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