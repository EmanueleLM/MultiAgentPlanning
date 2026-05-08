(define (domain calendar_scheduling_example_44_domain)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available isabella ?t)
      (available ronald ?t)
      (available amanda ?t)
    )
    :effect (scheduled)
  )
)