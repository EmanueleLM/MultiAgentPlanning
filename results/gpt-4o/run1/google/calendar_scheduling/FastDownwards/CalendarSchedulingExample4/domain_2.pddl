(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?t - time_slot)
    (meeting_scheduled ?t1 - time_slot ?t2 - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (consecutive ?t1 ?t2)
      (not (busy donna ?t1)) 
      (not (busy donna ?t2))
      (not (busy john ?t1)) 
      (not (busy john ?t2))
      (not (busy billy ?t1)) 
      (not (busy billy ?t2))
      (not (meeting_scheduled ?t1 ?t2))
    )
    :effect (and 
      (meeting_scheduled ?t1 ?t2)
    )
  )
)