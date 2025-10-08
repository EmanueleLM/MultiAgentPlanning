(define (domain CalendarSchedulingExample25)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant timeslot)
  (:predicates
    (avail ?p - participant ?t - timeslot)
    (scheduled)
    (chosen ?t - timeslot)
  )
  (:action select
    :parameters (?t - timeslot)
    :precondition (and
      (avail julia ?t)
      (avail joshua ?t)
      (avail nicholas ?t)
      (avail david ?t)
      (avail melissa ?t)
    )
    :effect (and
      (scheduled)
      (chosen ?t)
    )
  )
)