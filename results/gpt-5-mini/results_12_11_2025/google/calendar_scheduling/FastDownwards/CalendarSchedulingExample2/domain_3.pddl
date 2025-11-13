(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)

  (:predicates
    ;; slot-level hard availability (intersection of all participants' free slots)
    (free-all ?s - slot)

    ;; allowed after resolving soft preferences (only allowed slots are selectable)
    (allowed ?s - slot)

    ;; terminal facts indicating meeting scheduled
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

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