(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (requires ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting_scheduled ?m))
      (allowed_slot ?m ?s)
      (requires ?m lisa)
      (requires ?m bobby)
      (requires ?m randy)
      (free lisa ?s)
      (free bobby ?s)
      (free randy ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
    )
  )
)