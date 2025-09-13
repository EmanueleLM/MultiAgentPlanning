(define (domain meeting-scheduler-adl)
  (:requirements :strips :typing :negative-preconditions :equality :adl)
  (:types time-slot person)

  (:predicates
    (available ?p - person ?t - time-slot)
    (scheduled ?p - person ?t1 ?t2 - time-slot)
    (adjacent ?t1 - time-slot ?t2 - time-slot)
    (meeting-ready))

  (:action schedule-meeting-kathryn
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and (available kathryn ?t1)
           (available kathryn ?t2)
           (adjacent ?t1 ?t2)
           (not (scheduled kathryn ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled kathryn ?t1 ?t2))

  (:action schedule-meeting-charlotte
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and (available charlotte ?t1)
           (available charlotte ?t2)
           (adjacent ?t1 ?t2)
           (not (scheduled charlotte ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled charlotte ?t1 ?t2))

  (:action schedule-meeting-lauren
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and (available lauren ?t1)
           (available lauren ?t2)
           (adjacent ?t1 ?t2)
           (not (scheduled lauren ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled lauren ?t1 ?t2))
  
  (:action finalize-meeting
    :parameters (?t1 ?t2 - time-slot)
    :precondition
      (and (scheduled kathryn ?t1 ?t2)
           (scheduled charlotte ?t1 ?t2)
           (scheduled lauren ?t1 ?t2))
    :effect
      (meeting-ready))
)