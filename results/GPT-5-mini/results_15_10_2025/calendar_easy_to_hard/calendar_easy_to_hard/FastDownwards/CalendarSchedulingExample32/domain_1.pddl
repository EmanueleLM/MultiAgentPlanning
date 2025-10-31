(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)

  (:predicates
    (free ?a - agent ?t - time)
    (slot ?t - time)
    (allowed ?t - time)
    (scheduled)
    (unscheduled)
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
      (scheduled)
      (not (unscheduled))
    )
  )
)