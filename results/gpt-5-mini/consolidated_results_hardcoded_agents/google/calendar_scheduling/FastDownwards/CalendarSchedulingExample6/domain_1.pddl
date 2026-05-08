(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)            ; consecutive 30-min slot ordering
    (free ?p - participant ?s - slot)       ; participant is free on that 30-min slot
    (earliest_start ?s - slot)              ; marks earliest allowed start slot
    (meeting_scheduled)                     ; global flag that a meeting was scheduled
    (scheduled_at ?s - slot)                ; records the start slot where meeting is scheduled
  )

  (:action schedule-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (earliest_start ?s)
      ;; ensure two consecutive slots are free for each participant
      (free thomas ?s) (free thomas ?s2)
      (free dylan ?s)  (free dylan ?s2)
      (free jerry ?s)  (free jerry ?s2)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)