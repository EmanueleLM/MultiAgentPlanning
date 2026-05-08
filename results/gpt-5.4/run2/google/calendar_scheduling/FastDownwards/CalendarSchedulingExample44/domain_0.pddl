(define (domain meeting_schedule_monday_isabella_ronald_amanda)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (available isabella ?s)
      (available ronald ?s)
      (available amanda ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)