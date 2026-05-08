(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting slot)

  ;; Instance-specific participants and the meeting (kept as domain constants
  ;; so action preconditions can reference the exact participants)
  (:constants lisa bobby randy - participant
              team_meeting - meeting)

  (:predicates
    ;; participant p is already busy in slot s according to their existing calendar
    (busy_existing ?p - participant ?s - slot)
    ;; slot s is a valid meeting start within work hours
    (slot_within_workhours ?s - slot)
    ;; bobby's preference: slot s is acceptable to bobby
    (allowed_by_bobby ?s - slot)
    ;; meeting has been scheduled
    (scheduled ?m - meeting)
    ;; meeting m is scheduled at slot s
    (scheduled_at ?m - meeting ?s - slot)
    ;; participant p is booked (by this scheduled meeting) in slot s
    (booked ?p - participant ?s - slot)
  )

  ;; Schedule the single team meeting at a chosen 30-minute start slot.
  ;; Preconditions enforce:
  ;;  - the slot is within work hours,
  ;;  - the slot is acceptable to Bobby,
  ;;  - the meeting is not already scheduled,
  ;;  - none of the participants are already busy in that slot.
  ;; Effects record the meeting as scheduled at that slot and mark the participants booked.
  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (slot_within_workhours ?s)
      (allowed_by_bobby ?s)
      (not (scheduled team_meeting))
      (not (busy_existing lisa ?s))
      (not (busy_existing bobby ?s))
      (not (busy_existing randy ?s))
    )
    :effect (and
      (scheduled team_meeting)
      (scheduled_at team_meeting ?s)
      (booked lisa ?s)
      (booked bobby ?s)
      (booked randy ?s)
    )
  )
)