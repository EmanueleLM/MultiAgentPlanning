(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:constants diane kelly deborah - person)
  (:predicates
    (next ?t1 ?t2 - time)
    (free ?p - person ?t1 ?t2 - time)
    (meeting_scheduled)
  )

  ;; Action to schedule a half-hour meeting slot for Diane, Kelly, and Deborah.
  (:action schedule_meeting
    :parameters (?ts ?te - time)
    :precondition (and
      (next ?ts ?te)
      (free diane ?ts ?te)
      (free kelly ?ts ?te)
      (free deborah ?ts ?te)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)