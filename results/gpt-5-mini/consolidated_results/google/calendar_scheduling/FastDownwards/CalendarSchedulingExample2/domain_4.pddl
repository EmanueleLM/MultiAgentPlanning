(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    ;; actor and temporal objects
    (person ?p - person)
    (next-slot ?s1 - slot ?s2 - slot)

    ;; per-person per-slot hard constraints derived from calendars
    (busy ?p - person ?s - slot)
    (free ?p - person ?s - slot)

    ;; intersection of all participants' free slots (computed by the auditor)
    (free-all ?s - slot)

    ;; allowed slots after soft-preference resolution (auditor/orchestrator)
    (allowed ?s - slot)

    ;; terminal facts indicating meeting scheduled exactly once
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule the meeting into exactly one slot that is free for everyone
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (free-all ?s)
      (allowed ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)