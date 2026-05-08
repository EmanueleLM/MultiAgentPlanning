(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent loader carrier inspector - agent
    object
    location
    phase
  )

  (:predicates
    ;; agent/location/object state
    (at ?a - agent ?l - location)
    (obj-at ?o - object ?l - location)

    ;; carrying and status
    (carrying ?c - carrier ?o - object)
    (loaded ?o - object)
    (delivered ?o - object)

    ;; phase sequencing and completion
    (phase-current ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)
    (phase-complete ?p - phase)

    ;; marker for which locations are valid delivery targets
    (goal-location ?l - location)

    ;; simple connectivity graph
    (connected ?l1 - location ?l2 - location)
  )

  ;; Loader action: must execute during phase1 and co-located with a carrier and object.
  (:action loader-load
    :parameters (?ldr - loader ?car - carrier ?o - object ?loc - location)
    :precondition (and
      (phase-current phase1)
      (at ?ldr ?loc)
      (at ?car ?loc)
      (obj-at ?o ?loc)
      (not (loaded ?o))
    )
    :effect (and
      (loaded ?o)
      (carrying ?car ?o)
      (not (obj-at ?o ?loc))
    )
  )

  ;; Advance from phase1 to phase2: requires all objects to be loaded.
  ;; This action is parameterized over the concrete objects so the planner can
  ;; enforce that every listed object is loaded before advancing.
  (:action advance-phase-1-to-2
    :parameters (?from - phase ?to - phase ?b1 - object ?b2 - object)
    :precondition (and
      (phase-current ?from)
      (phase-next ?from ?to)
      (loaded ?b1)
      (loaded ?b2)
      ;; ensure this is the correct phase pair
      (= ?from phase1)
      (= ?to phase2)
    )
    :effect (and
      (phase-complete ?from)
      (not (phase-current ?from))
      (phase-current ?to)
    )
  )

  ;; Carrier movement allowed only during phase2, must follow connectivity edges.
  (:action carrier-move
    :parameters (?car - carrier ?from - location ?to - location)
    :precondition (and
      (phase-current phase2)
      (at ?car ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?car ?from))
      (at ?car ?to)
    )
  )

  ;; Deliver carried object at a designated goal location during phase2.
  (:action carrier-deliver
    :parameters (?car - carrier ?o - object ?loc - location)
    :precondition (and
      (phase-current phase2)
      (at ?car ?loc)
      (carrying ?car ?o)
      (goal-location ?loc)
      (not (delivered ?o))
    )
    :effect (and
      (delivered ?o)
      (obj-at ?o ?loc)
      (not (carrying ?car ?o))
      (not (loaded ?o))
    )
  )

  ;; Advance from phase2 to phase3: requires all objects to be delivered.
  (:action advance-phase-2-to-3
    :parameters (?from - phase ?to - phase ?b1 - object ?b2 - object)
    :precondition (and
      (phase-current ?from)
      (phase-next ?from ?to)
      (delivered ?b1)
      (delivered ?b2)
      (= ?from phase2)
      (= ?to phase3)
    )
    :effect (and
      (phase-complete ?from)
      (not (phase-current ?from))
      (phase-current ?to)
    )
  )

  ;; Inspector verifies delivered items in phase3 and marks phase complete.
  (:action inspector-verify
    :parameters (?insp - inspector ?loc - location ?b1 - object ?b2 - object)
    :precondition (and
      (phase-current phase3)
      (at ?insp ?loc)
      (obj-at ?b1 ?loc)
      (obj-at ?b2 ?loc)
      (delivered ?b1)
      (delivered ?b2)
    )
    :effect (and
      (phase-complete phase3)
    )
  )
)