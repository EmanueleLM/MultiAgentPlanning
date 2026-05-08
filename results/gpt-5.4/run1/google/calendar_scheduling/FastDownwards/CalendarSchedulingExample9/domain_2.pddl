(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    day
    slot
  )

  (:predicates
    (busy ?p - participant ?d - day ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?d - day ?s - slot)
    (slot-in-workday ?d - day ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?d - day ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition
      (and
        (not (scheduled ?m))
        (slot-in-workday ?d ?s)
        (requires ?m ?p1)
        (requires ?m ?p2)
        (requires ?m ?p3)
        (not (busy ?p1 ?d ?s))
        (not (busy ?p2 ?d ?s))
        (not (busy ?p3 ?d ?s))
      )
    :effect
      (and
        (scheduled ?m)
        (scheduled-at ?m ?d ?s)
      )
  )
)