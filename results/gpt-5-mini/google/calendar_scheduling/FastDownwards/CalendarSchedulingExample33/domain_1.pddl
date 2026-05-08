(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting slot)

  (:predicates
    (busy_existing ?p - participant ?s - slot)
    (slot_within_workhours ?s - slot)
    (allowed_by_bobby ?s - slot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (booked ?p - participant ?s - slot)
  )

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