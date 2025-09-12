(define (domain calendar-scheduling)
  (:requirements :strips :typing :adl :negative-preconditions)
  (:types person time-slot)
  (:predicates 
    (available ?p - person ?t - time-slot)
    (meeting-scheduled ?t - time-slot)
    (valid-slot ?t - time-slot)
    (time-ordering ?t1 - time-slot ?t2 - time-slot)
  )
  (:action schedule-meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?t - time-slot)
    :precondition (and
      (valid-slot ?t)
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t))
    :effect (meeting-scheduled ?t)
  )
  (:action order-timeslot
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and (valid-slot ?t1) (valid-slot ?t2) (not (= ?t1 ?t2))) 
    :effect (time-ordering ?t1 ?t2)
  )
)