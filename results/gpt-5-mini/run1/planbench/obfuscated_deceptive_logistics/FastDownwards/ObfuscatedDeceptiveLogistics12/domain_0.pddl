(define (domain manipulator_inspect_audit)
  ; Requirements: STRIPS actions, typing, and negative preconditions (FastDownward compatible)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    robot part location instrument inspector auditor
  )

  ; Predicates
  (:predicates
    (at ?r - robot ?l - location)                ; robot location
    (part-at ?p - part ?l - location)           ; part location
    (holding ?r - robot ?p - part)              ; robot holding a part
    (attached ?p1 - part ?p2 - part)            ; part p1 attached to p2 (assembly)
    (assembly-done)                             ; assembly phase completed
    (inspected ?p - part)                       ; part inspected by inspector
    (inspection-done)                           ; inspection phase completed
    (instrument-calibrated ?i - instrument)     ; instrument is calibrated
    (instrument-at ?i - instrument ?l - location) ; instrument location
    (used-instrument ?i - instrument)           ; instrument was used in inspection
    (logged-by-inspector ?p - part ?insp - inspector) ; inspector logged the inspection
    (certified ?p - part)                       ; auditor certified the part
    (audit-logged ?p - part)                    ; auditor logged the certification
    (inspector-at ?insp - inspector ?l - location) ; inspector location
    (auditor-at ?aud - auditor ?l - location)   ; auditor location (kept for clarity)
    (battery-ok ?r - robot)                     ; robot battery condition (hard constraint)
  )

  ; Actions executed by the manipulator (manipulator_* prefixed)
  (:action manipulator_move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and
      (at ?r ?from)
      (not (at ?r ?to))
      (battery-ok ?r)
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
    )
  )

  (:action manipulator_pick
    :parameters (?r - robot ?p - part ?l - location)
    :precondition (and
      (at ?r ?l)
      (part-at ?p ?l)
      (battery-ok ?r)
      (not (holding ?r ?p))
    )
    :effect (and
      (holding ?r ?p)
      (not (part-at ?p ?l))
    )
  )

  (:action manipulator_place
    :parameters (?r - robot ?p - part ?l - location)
    :precondition (and
      (at ?r ?l)
      (holding ?r ?p)
      (battery-ok ?r)
    )
    :effect (and
      (not (holding ?r ?p))
      (part-at ?p ?l)
    )
  )

  (:action manipulator_attach
    :parameters (?r - robot ?p1 - part ?p2 - part ?l - location)
    :precondition (and
      (at ?r ?l)
      (holding ?r ?p1)
      (part-at ?p2 ?l)
      (battery-ok ?r)
      (not (attached ?p1 ?p2))
    )
    :effect (and
      (attached ?p1 ?p2)
      (not (holding ?r ?p1))
      (part-at ?p1 ?l)
      (assembly-done)
    )
  )

  ; Actions executed by the inspector (inspector_* prefixed)
  ; Inspector must inspect after assembly-done and must use a calibrated instrument at the inspection location.
  (:action inspector_inspect
    :parameters (?insp - inspector ?i - instrument ?p - part ?l - location)
    :precondition (and
      (assembly-done)
      (inspector-at ?insp ?l)
      (instrument-at ?i ?l)
      (instrument-calibrated ?i)
      (part-at ?p ?l)
      (not (inspected ?p))
    )
    :effect (and
      (inspected ?p)
      (used-instrument ?i)
      (inspection-done)
    )
  )

  (:action inspector_log
    :parameters (?insp - inspector ?p - part)
    :precondition (and
      (inspected ?p)
      (not (logged-by-inspector ?p ?insp))
    )
    :effect (and
      (logged-by-inspector ?p ?insp)
    )
  )

  ; Actions executed by the auditor (auditor_* prefixed)
  ; Auditor requires that inspection has been completed and logged by an inspector before certifying.
  (:action auditor_review_and_certify
    :parameters (?aud - auditor ?p - part ?insp - inspector)
    :precondition (and
      (inspection-done)
      (logged-by-inspector ?p ?insp)
      (not (certified ?p))
    )
    :effect (and
      (certified ?p)
      (audit-logged ?p)
    )
  )
)