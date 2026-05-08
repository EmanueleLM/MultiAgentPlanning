(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free-slot ?p - participant ?s - slot)
    (selected-slot ?s - slot)
    (attends-slot ?p - participant ?s - slot)
    (meeting-scheduled)
  )

  ;; This action schedules the meeting at the audited earliest slot (11:00).
  ;; Preconditions require that every participant is free at that slot.
  (:action schedule-earliest
    :precondition (and
      (free-slot brittany slot1100)
      (free-slot emily slot1100)
      (free-slot doris slot1100)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (selected-slot slot1100)
      (attends-slot brittany slot1100)
      (attends-slot emily slot1100)
      (attends-slot doris slot1100)
    )
  )
)