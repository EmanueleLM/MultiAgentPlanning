(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (earliest_start ?s - slot)
    (meeting_scheduled)
    (scheduled_start ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (earliest_start ?s)
      (free thomas ?s) (free thomas ?s2)
      (free dylan ?s)  (free dylan ?s2)
      (free jerry ?s)  (free jerry ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_start ?s)
    )
  )
)