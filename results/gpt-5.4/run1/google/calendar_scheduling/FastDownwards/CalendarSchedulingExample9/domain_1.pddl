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

  (:action schedule-meeting
    :parameters (?m - meeting ?d - day ?s - slot)
    :precondition
      (and
        (not (scheduled ?m))
        (slot-in-workday ?d ?s)
        (requires ?m diane)
        (requires ?m kelly)
        (requires ?m deborah)
        (not (busy diane ?d ?s))
        (not (busy kelly ?d ?s))
        (not (busy deborah ?d ?s))
      )
    :effect
      (and
        (scheduled ?m)
        (scheduled-at ?m ?d ?s)
      )
  )
)