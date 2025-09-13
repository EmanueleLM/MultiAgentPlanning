```pddl
(define (domain meeting-scheduler)
  (:requirements :strips :typing :adl)
  (:types time-slot person)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (scheduled ?t1 - time-slot ?t2 - time-slot)
    (meeting-ready)
  )

  (:action schedule-kathryn
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available kathryn ?t1)
           (available kathryn ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))

  (:action schedule-charlotte
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available charlotte ?t1)
           (available charlotte ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))

  (:action schedule-lauren
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition 
      (and (available lauren ?t1)
           (available lauren ?t2)
           (not (scheduled ?t1 ?t2))
           (meeting-ready))
    :effect 
      (scheduled ?t1 ?t2))
)
```