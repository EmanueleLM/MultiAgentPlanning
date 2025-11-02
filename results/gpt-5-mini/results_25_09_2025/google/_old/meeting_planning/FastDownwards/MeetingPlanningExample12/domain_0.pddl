(define (domain integrated-meeting-domain)
  (:requirements :strips :typing :fluents :numeric-fluents :negative-preconditions :equality)
  (:types person agent location)

  (:predicates
    ;; visitor location (single visitor agent)
    (at-visitor ?l - location)
    ;; planner/agent location (single planner agent)
    (at-agent ?l - location)
    ;; person location (Barbara)
    (at-person ?p - person ?l - location)
    ;; meeting status
    (met ?p - person)
  )

  (:functions
    (time) ; minutes since midnight
  )

  ;; -----------------------
  ;; Visitor agent actions (from first agent's PDDL, adapted & unified)
  ;; -----------------------

  ;; Travel from north-beach to alamo-square (16 minutes)
  (:action visitor-travel-nb-to-alamo
    :precondition (at-visitor north-beach)
    :effect (and
      (not (at-visitor north-beach))
      (at-visitor alamo-square)
      (increase (time) 16)
    )
  )

  ;; Travel from alamo-square to north-beach (15 minutes)
  (:action visitor-travel-alamo-to-nb
    :precondition (at-visitor alamo-square)
    :effect (and
      (not (at-visitor alamo-square))
      (at-visitor north-beach)
      (increase (time) 15)
    )
  )

  ;; Wait until Barbara's availability window opens at 18:00 (1080).
  ;; If current time is <= 1080, set time to 1080.
  (:action visitor-wait-to-1080
    :precondition (<= (time) 1080)
    :effect (and
      (assign (time) 1080)
    )
  )

  ;; Visitor-initiated meeting of Barbara for 90 minutes.
  ;; Requires visitor, planner-agent, and Barbara all at alamo-square at meeting start.
  ;; Meeting start must be between 1080 and 1200 inclusive so a 90-minute meeting finishes by 1290.
  (:action visitor-meet-barbara
    :precondition (and
      (at-visitor alamo-square)
      (at-agent alamo-square)
      (at-person barbara alamo-square)
      (not (met barbara))
      (>= (time) 1080)
      (<= (time) 1200)
    )
    :effect (and
      (met barbara)
      (increase (time) 90)
    )
  )

  ;; -----------------------
  ;; Planner/Agent actions (from second agent's PDDL, converted to non-durative)
  ;; -----------------------

  ;; Travel from north-beach to alamo-square: 16 minutes
  (:action agent-travel-northbeach-to-alamosquare
    :precondition (at-agent north-beach)
    :effect (and
      (not (at-agent north-beach))
      (at-agent alamo-square)
      (increase (time) 16)
    )
  )

  ;; Travel from alamo-square to north-beach: 15 minutes
  (:action agent-travel-alamosquare-to-northbeach
    :precondition (at-agent alamo-square)
    :effect (and
      (not (at-agent alamo-square))
      (at-agent north-beach)
      (increase (time) 15)
    )
  )

  ;; Agent-initiated meeting with a person (Barbara) for 90 minutes.
  ;; Requires planner agent, visitor, and Barbara at alamo-square at start.
  ;; Meeting start must be between 1080 and 1200 inclusive.
  (:action agent-meet-with-barbara
    :precondition (and
      (at-agent alamo-square)
      (at-visitor alamo-square)
      (at-person barbara alamo-square)
      (not (met barbara))
      (>= (time) 1080)
      (<= (time) 1200)
    )
    :effect (and
      (met barbara)
      (increase (time) 90)
    )
  )

)