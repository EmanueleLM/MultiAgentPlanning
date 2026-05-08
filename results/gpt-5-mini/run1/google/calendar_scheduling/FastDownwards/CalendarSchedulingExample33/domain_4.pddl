(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant meeting slot)

  ;; Instance-specific constants (participants and the single meeting to schedule)
  (:constants lisa bobby randy - participant
              team_meeting - meeting)

  (:predicates
    ;; participant p is already busy during slot s according to existing calendar
    (busy_existing ?p - participant ?s - slot)
    ;; slot s is within work hours and thus a candidate start time for the meeting
    (slot_within_workhours ?s - slot)
    ;; bobby's preference: slot s is acceptable to bobby (he prefers to avoid after 15:00)
    (allowed_by_bobby ?s - slot)
    ;; meeting has been scheduled
    (scheduled ?m - meeting)
    ;; meeting m is scheduled at slot s
    (scheduled_at ?m - meeting ?s - slot)
    ;; participant p becomes booked for slot s by scheduling the meeting
    (booked ?p - participant ?s - slot)
  )

  ;; Single action: schedule the team meeting at a specific slot.
  ;; This action is instance-specific: it checks existing busy slots for each named participant
  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (slot_within_workhours ?s)
      (allowed_by_bobby ?s)
      (not (scheduled team_meeting))
      ;; ensure none of the participants are already busy in this slot
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