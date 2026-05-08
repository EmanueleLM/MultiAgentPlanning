(define (domain jack_of_all_trades_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  ;; Declare the three people as domain-level constants so actions can refer to them directly.
  (:constants isabella ronald amanda - person)

  (:predicates
    (work_slot ?s - slot)
    (busy ?p - person ?s - slot)
    (slot_occupied ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
    (preferred_slot ?s - slot)
  )

  ;; Single action to schedule the meeting at a chosen slot for the three named participants.
  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (work_slot ?s)
      (not (slot_occupied ?s))
      (not (meeting_scheduled))
      (not (busy isabella ?s))
      (not (busy ronald ?s))
      (not (busy amanda ?s))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
      (slot_occupied ?s)
      (busy isabella ?s)
      (busy ronald ?s)
      (busy amanda ?s)
    )
  )
)