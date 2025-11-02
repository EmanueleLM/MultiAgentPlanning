(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types agent time)

  (:constants nicole christine anna terry julie abigail - agent)

  (:predicates
    (free ?a - agent ?t - time)
    (slot ?t - time)
    (allowed ?t - time)
    (scheduled)
    (unscheduled)
  )

  (:action schedule_meeting
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