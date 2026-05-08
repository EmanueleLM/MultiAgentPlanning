(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant time_slot
  )

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (can_start_after ?p - participant ?t - time_slot)
    (available ?t1 - time_slot ?t2 - time_slot)
    (meeting_time ?t1 - time_slot ?t2 - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and
                    (available ?t1 ?t2)
                    (forall (?p - participant)
                      (and
                        (not (busy ?p ?t1))
                        (not (busy ?p ?t2))
                        (not (can_start_after ?p ?t1))
                      )
                    )
                  )
    :effect (and
              (meeting_time ?t1 ?t2)
            )
  )
)