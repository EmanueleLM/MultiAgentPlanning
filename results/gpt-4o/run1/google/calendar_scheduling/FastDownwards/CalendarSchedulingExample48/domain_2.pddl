(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant time_slot
  )

  (:predicates
    (busy ?p - participant ?t - time_slot) 
    (preference_not_before ?p - participant ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
    (meeting_time ?t1 - time_slot ?t2 - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and
                    (consecutive ?t1 ?t2)
                    (not (exists (?p - participant) (and
                      (busy ?p ?t1)
                      (busy ?p ?t2)
                      (preference_not_before ?p ?t1)
                    )))
                  )
    :effect (and
              (forall (?p - participant)
                (and
                  (not (busy ?p ?t1))
                  (not (busy ?p ?t2))
                  (not (preference_not_before ?p ?t1))
                )
              )
              (meeting_time ?t1 ?t2)
            )
  )
)