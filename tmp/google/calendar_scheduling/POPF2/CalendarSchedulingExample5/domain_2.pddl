(define (domain meeting-scheduler)
  (:requirements :strips :typing)
  (:types time-slot person)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (scheduled ?t1 - time-slot ?t2 - time-slot)
    (meeting-ready)
  )

  (:action schedule-kathryn
    :parameters (?p - person ?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available ?p ?t1)
           (available ?p ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))

  (:action schedule-charlotte
    :parameters (?p - person ?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available ?p ?t1)
           (available ?p ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))

  (:action schedule-lauren
    :parameters (?p - person ?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available ?p ?t1)
           (available ?p ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))
)