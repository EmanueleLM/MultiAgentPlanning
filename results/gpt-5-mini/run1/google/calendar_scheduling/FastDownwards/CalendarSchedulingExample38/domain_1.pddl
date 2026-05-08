(define (domain jack_of_all_trades_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (work_slot ?t - timeslot)
    (busy ?p - person ?t - timeslot)
    (meeting_scheduled)
    (meeting_at ?t - timeslot)
  )
  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
      (work_slot ?t)
      (not (busy catherine ?t))
      (not (busy michael ?t))
      (not (busy alexander ?t))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?t)
    )
  )
)