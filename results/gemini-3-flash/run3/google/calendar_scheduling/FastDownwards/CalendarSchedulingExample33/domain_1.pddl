(define (domain calendarscheduling_example33)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    lisa bobby randy - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_at ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available lisa ?t)
      (available bobby ?t)
      (available randy ?t)
    )
    :effect (and
      (meeting_at ?t)
      (meeting_scheduled)
    )
  )
)