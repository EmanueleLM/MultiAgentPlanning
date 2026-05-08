(define (domain MysteryBlocksworld16)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj phase)

  (:predicates
    ;; World state
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)

    (pain ?o - obj)
    (craves ?x - obj ?y - obj)

    ;; Bookkeeping fact created by Attack and consumed by Succumb so Succumb
    ;; restores exactly the province/planet pair that Attack removed.
    (attacked ?x - obj ?y - obj)

    ;; Discrete, ordered stages to enforce contiguous progression and forbid
    ;; oscillation. Exactly one current-phase holds at any time; actions
    ;; advance from a phase to its successor.
    (current-phase ?p - phase)
    (successor ?p1 - phase ?p2 - phase)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions
  ;;
  ;; All actions require the current-phase ?ph and a successor ?phn and
  ;; have the effect of advancing the single current-phase to ?phn.
  ;; This enforces contiguity (no action can be taken "out of time")
  ;; and makes phase progression a hard requirement rather than a
  ;; bookkeeping token that can be violated later.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; attacker: Attack action
  ;; Assumption (explicit): Attack takes two objects (?o and ?p).
  ;; Preconditions: province ?o, planet ?p, harmony, and current phase.
  ;; Effects: produces pain on ?o, records (attacked ?o ?p), removes
  ;; province ?o, planet ?p, and harmony. Advances phase.
  (:action attacker-attack
    :parameters (?o - obj ?p - obj ?ph - phase ?phn - phase)
    :precondition (and
      (province ?o)
      (planet ?p)
      (harmony)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (pain ?o)
      (attacked ?o ?p)

      (not (province ?o))
      (not (planet ?p))
      (not (harmony))

      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; succumber: Succumb action
  ;; Preconditions: a pain fact and the attacked pairing that created it.
  ;; Effects: restores the exact province and planet removed by the Attack,
  ;; restores harmony, removes pain and the attacked record. Advances phase.
  (:action succumber-succumb
    :parameters (?o - obj ?p - obj ?ph - phase ?phn - phase)
    :precondition (and
      (pain ?o)
      (attacked ?o ?p)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (province ?o)
      (planet ?p)
      (harmony)

      (not (pain ?o))
      (not (attacked ?o ?p))

      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; overcomer: Overcome action
  ;; Preconditions: province of the "other" object and pain on the primary.
  ;; Effects: produces harmony, grants province to the primary object,
  ;; creates craves(primary, other), removes province from other and the pain.
  ;; Advances phase.
  (:action overcomer-overcome
    :parameters (?x - obj ?other - obj ?ph - phase ?phn - phase)
    :precondition (and
      (province ?other)
      (pain ?x)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)

      (not (province ?other))
      (not (pain ?x))

      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; feaster: Feast action
  ;; Preconditions: craves(primary, other), province(primary), harmony.
  ;; Effects: produces pain on primary and transfers province to other;
  ;; removes the craves relation, removes province from primary and harmony.
  ;; Advances phase.
  (:action feaster-feast
    :parameters (?x - obj ?other - obj ?ph - phase ?phn - phase)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (pain ?x)
      (province ?other)

      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))

      ;; advance phase
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )
)