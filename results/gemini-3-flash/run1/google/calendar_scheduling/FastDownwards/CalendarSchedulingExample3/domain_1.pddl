(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants arthur michael samantha - person)
  (:predicates
    (available ?p - person ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (meeting_scheduled)
  )

  ;; A one-hour meeting covers two consecutive 30-minute intervals.
  ;; We specify ?t1 as the start time, ?t2 as the middle point, and ?t3 as the end time.
  ;; Availability for each participant must hold for the intervals starting at ?t1 and ?t2.
  (:action schedule_1hr_meeting
    :parameters (?t1 ?t2 ?t3 - timeslot)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (available arthur ?t1)
      (available arthur ?t2)
      (available michael ?t1)
      (available michael ?t2)
      (available samantha ?t1)
      (available samantha ?t2)
    )
    :effect (meeting_scheduled)
  )
)