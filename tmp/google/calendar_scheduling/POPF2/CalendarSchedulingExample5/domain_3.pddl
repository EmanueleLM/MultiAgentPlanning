(define (domain meeting-scheduler)
  (:requirements :strips :typing)
  (:types time-slot person)

  (:predicates
    (available ?p - person ?t - time-slot)
    (scheduled-kathryn ?t1 - time-slot ?t2 - time-slot)
    (scheduled-charlotte ?t1 - time-slot ?t2 - time-slot)
    (scheduled-lauren ?t1 - time-slot ?t2 - time-slot)
    (meeting-ready))

  (:action schedule-meeting
    :parameters (?p - person ?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available ?p ?t1)
           (available ?p ?t2)
           (meeting-ready))
    :effect
      (or (and (available kathryn ?t1) (available kathryn ?t2) (not (scheduled-kathryn ?t1 ?t2)))
          (and (available charlotte ?t1) (available charlotte ?t2) (not (scheduled-charlotte ?t1 ?t2)))
          (and (available lauren ?t1) (available lauren ?t2) (not (scheduled-lauren ?t1 ?t2)))))
  
  (:action set-scheduled-kathryn
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available kathryn ?t1)
           (available kathryn ?t2)
           (not (scheduled-kathryn ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled-kathryn ?t1 ?t2))
  
  (:action set-scheduled-charlotte
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available charlotte ?t1)
           (available charlotte ?t2)
           (not (scheduled-charlotte ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled-charlotte ?t1 ?t2))
  
  (:action set-scheduled-lauren
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available lauren ?t1)
           (available lauren ?t2)
           (not (scheduled-lauren ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled-lauren ?t1 ?t2))
)