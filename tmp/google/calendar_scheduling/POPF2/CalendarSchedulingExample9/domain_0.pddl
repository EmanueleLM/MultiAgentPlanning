(define (domain unified-meeting-scheduler)
  (:requirements :strips :typing)
  
  (:types person time-slot)
  
  (:predicates
    (busy ?p - person ?t - time-slot)
    (available ?p - person ?t - time-slot)
    (meeting-scheduled ?t - time-slot)
    (slot-before ?t1 ?t2 - time-slot)
  )
  
  (:action check-availability
    :parameters (?p - person ?t - time-slot)
    :precondition (not (busy ?p ?t))
    :effect (available ?p ?t)
  )
  
  (:action schedule-meeting-diane-deborah
    :parameters (?t - time-slot)
    :precondition (and (available diane ?t)
                       (available deborah ?t)
                       (not (meeting-scheduled ?t)))
    :effect (meeting-scheduled ?t)
  )
)