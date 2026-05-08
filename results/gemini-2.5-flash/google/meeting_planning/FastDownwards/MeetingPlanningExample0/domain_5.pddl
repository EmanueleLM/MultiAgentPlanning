(define (domain meeting-planning-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time-point)
  (:predicates
    (at ?a - agent ?l - location)
    (meeting-occurred ?a1 - agent ?a2 - agent)
    (is-traveler ?a - agent)
    (is-stephanie ?a - agent)

    ; Temporal predicates
    (current-time ?tp - time-point)
    (time-point-precedes ?tp1 ?tp2 - time-point)

    ; Durative action conversion states
    (travel-in-progress ?a - agent ?from - location ?to - location ?start_tp - time-point)
    (meeting-in-progress ?traveler - agent ?stephanie - agent ?loc - location ?start_tp - time-point)

    ; Pre-computed temporal constraints
    (duration-equals-20min ?start_tp ?end_tp - time-point)
    (duration-ge-120min ?start_tp ?end_tp - time-point)
    (stephanie-available-at-time ?tp - time-point)
    (stephanie-available-throughout ?start_tp ?end_tp - time-point)
  )

  (:functions
    (total-cost)
  )

  ; Action to advance the current symbolic time
  (:action advance-time
    :parameters (?from_tp ?to_tp - time-point)
    :precondition (and
      (current-time ?from_tp)
      (time-point-precedes ?from_tp ?to_tp)
    )
    :effect (and
      (not (current-time ?from_tp))
      (current-time ?to_tp)
    )
  )

  ; Travel action: Split into start and end to simulate duration
  (:action start-travel
    :parameters (?a - agent ?from - location ?to - location ?start_tp - time-point)
    :precondition (and
      (current-time ?start_tp)
      (at ?a ?from)
      (not (travel-in-progress ?a ?from ?to ?start_tp))
    )
    :effect (and
      (not (at ?a ?from))
      (travel-in-progress ?a ?from ?to ?start_tp)
    )
  )

  (:action end-travel
    :parameters (?a - agent ?from - location ?to - location ?start_tp ?end_tp - time-point)
    :precondition (and
      (travel-in-progress ?a ?from ?to ?start_tp)
      (current-time ?end_tp)
      (duration-equals-20min ?start_tp ?end_tp) ; Enforce 20 minute duration
    )
    :effect (and
      (not (travel-in-progress ?a ?from ?to ?start_tp))
      (at ?a ?to)
      (increase (total-cost) 1)
    )
  )

  ; Meet Stephanie action: Split into start and end to simulate duration and time windows
  (:action start-meet-stephanie
    :parameters (?traveler - agent ?stephanie - agent ?loc - location ?start_tp - time-point)
    :precondition (and
      (is-traveler ?traveler)
      (is-stephanie ?stephanie)
      (at ?traveler ?loc)
      (at ?stephanie ?loc) ; ADDED: Stephanie must also be at the meeting location
      (current-time ?start_tp)
      (stephanie-available-at-time ?start_tp) ; Stephanie must be available at start of meeting
      (not (meeting-in-progress ?traveler ?stephanie ?loc ?start_tp))
    )
    :effect (and
      (meeting-in-progress ?traveler ?stephanie ?loc ?start_tp)
    )
  )

  (:action end-meet-stephanie
    :parameters (?traveler - agent ?stephanie - agent ?loc - location ?start_tp ?end_tp - time-point)
    :precondition (and
      (meeting-in-progress ?traveler ?stephanie ?loc ?start_tp)
      (current-time ?end_tp)
      (duration-ge-120min ?start_tp ?end_tp) ; Minimum 120 minutes duration
      (stephanie-available-throughout ?start_tp ?end_tp) ; Stephanie must be available continuously during the meeting
    )
    :effect (and
      (not (meeting-in-progress ?traveler ?stephanie ?loc ?start_tp))
      (meeting-occurred ?traveler ?stephanie)
      (increase (total-cost) 1)
    )
  )
)