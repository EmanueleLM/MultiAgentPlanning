(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (earlier ?s1 - slot ?s2 - slot)
    (required ?p - participant)
    (joint_candidate ?s - slot)
    (earliest_candidate ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_earliest
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (earliest_candidate ?s)
      (joint_candidate ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)