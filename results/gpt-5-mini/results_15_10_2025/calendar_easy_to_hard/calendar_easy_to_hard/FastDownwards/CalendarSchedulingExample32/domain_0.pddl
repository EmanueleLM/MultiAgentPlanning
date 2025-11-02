(define (domain meeting-scheduling)
  (:requirements :strips :typing :existential-preconditions)
  (:types agent time)

  (:predicates
    (free ?a - agent ?t - time)    ; agent is free at time slot
    (slot ?t - time)               ; time is a valid slot
    (allowed ?t - time)            ; slot allowed by Anna's preference (treated as hard)
    (scheduled ?t - time)          ; meeting scheduled at slot
    (unscheduled)                  ; no meeting scheduled yet
  )

  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (slot ?t)
      (allowed ?t)
      (free nicole ?t)
      (free christine ?t)
      (free anna ?t)
      (free terry ?t)
      (free julie ?t)
      (free abigail ?t)
    )
    :effect (and
      (scheduled ?t)
      (not (unscheduled))
    )
  )
)