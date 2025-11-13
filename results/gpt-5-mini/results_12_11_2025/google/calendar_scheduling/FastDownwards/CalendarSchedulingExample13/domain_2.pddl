(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee timeslot)
  (:predicates
    (attendee ?a - attendee)
    (available ?a - attendee ?t - timeslot)
    (feasible ?t - timeslot)
    (chosen ?t - timeslot)
    (scheduled)
    (next ?t1 - timeslot ?t2 - timeslot)
    (work-hour ?t - timeslot)
  )

  ;; choose-slot requires that the timeslot is marked feasible and every required attendee
  ;; is available for that timeslot. The action produces a single terminal scheduled state
  ;; and marks the chosen timeslot as chosen. The negative precondition prevents re-scheduling.
  (:action choose-slot
    :parameters (?t - timeslot ?g - attendee ?r - attendee ?b - attendee)
    :precondition (and
      (feasible ?t)
      (not (scheduled))
      (attendee ?g)
      (attendee ?r)
      (attendee ?b)
      (available ?g ?t)
      (available ?r ?t)
      (available ?b ?t)
    )
    :effect (and
      (chosen ?t)
      (scheduled)
      (not (feasible ?t))
    )
  )
)