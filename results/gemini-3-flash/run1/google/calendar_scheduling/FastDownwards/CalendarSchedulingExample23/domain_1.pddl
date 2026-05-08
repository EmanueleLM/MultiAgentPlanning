(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:predicates
    (available ?p - person ?t1 ?t2 - time_slot)
    (next ?t1 ?t2 - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t1 ?t2 ?t3 - time_slot)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      ;; Everyone must be available for both 30-minute intervals
      (available billy ?t1 ?t2)
      (available billy ?t2 ?t3)
      (available maria ?t1 ?t2)
      (available maria ?t2 ?t3)
      (available william ?t1 ?t2)
      (available william ?t2 ?t3)
    )
    :effect (meeting_scheduled)
  )
)