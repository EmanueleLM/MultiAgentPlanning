(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)

  (:predicates
    (busy ?p - person ?t - time_slot)
    (meeting_scheduled ?t1 - time_slot ?t2 - time_slot)
    (next ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (next ?t1 ?t2)
      (not (exists (?p - person) 
        (or 
          (busy ?p ?t1)
          (busy ?p ?t2)
        )
      ))
      (not (meeting_scheduled ?t1 ?t2))
    )
    :effect (meeting_scheduled ?t1 ?t2)
  )
)