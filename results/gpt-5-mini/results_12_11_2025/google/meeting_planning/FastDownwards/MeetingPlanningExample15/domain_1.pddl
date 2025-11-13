(define (domain MeetingPlanningExample15)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types location agent)
  (:predicates
    (at ?a - agent ?l - location)
    (met-john)
  )
  (:functions
    (time) ; minutes since 09:00 (initially 0)
  )

  ;; Travel from Russian Hill to Golden Gate Park (21 minutes)
  (:action travel-rh-to-gg
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a russian_hill)
      ;; ensure action moves to the intended target location
      (not (at ?a golden_gate_park)) ;; negative-precondition used to represent movement
    )
    :effect (and
      (not (at ?a russian_hill))
      (at ?a golden_gate_park)
      (increase (time) 21)
    )
  )

  ;; Travel from Golden Gate Park to Russian Hill (19 minutes)
  (:action travel-gg-to-rh
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a golden_gate_park)
      (not (at ?a russian_hill))
    )
    :effect (and
      (not (at ?a golden_gate_park))
      (at ?a russian_hill)
      (increase (time) 19)
    )
  )

  ;; Meeting actions: discrete, duration-fixed meeting actions that enforce John's window.
  ;; John's availability window: start >= 240 (13:00), end <= 555 (18:15).
  ;; Meeting must start at time t where t >= 240 and t + duration <= 555.

  ;; Minimal meeting: 90 minutes
  (:action meet-90
    :parameters (?a - agent)
    :precondition (and
      (at ?a golden_gate_park)
      (not (met-john))
      (>= (time) 240)        ;; cannot start before 13:00
      (<= (time) 465)        ;; start <= 555 - 90 = 465
    )
    :effect (and
      (met-john)
      (increase (time) 90)
    )
  )

  ;; Medium meeting: 150 minutes
  (:action meet-150
    :parameters (?a - agent)
    :precondition (and
      (at ?a golden_gate_park)
      (not (met-john))
      (>= (time) 240)        ;; cannot start before 13:00
      (<= (time) 405)        ;; start <= 555 - 150 = 405
    )
    :effect (and
      (met-john)
      (increase (time) 150)
    )
  )

  ;; Long meeting: 315 minutes (full window 13:00-18:15)
  ;; This action requires start time exactly 240 (13:00) so that end is exactly 555.
  (:action meet-315
    :parameters (?a - agent)
    :precondition (and
      (at ?a golden_gate_park)
      (not (met-john))
      (>= (time) 240)
      (<= (time) 240)
    )
    :effect (and
      (met-john)
      (increase (time) 315)
    )
  )
)