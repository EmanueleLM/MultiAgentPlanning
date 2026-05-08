(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    time
  )

  (:predicates
    (busy ?p - participant ?t - time) 
    (preference_not_before ?p - participant ?t - time)
    (consecutive ?t1 - time ?t2 - time)
    (meeting_scheduled ?p - participant)
  )

  (:action schedule_meeting
    :parameters (?p - participant ?t1 - time ?t2 - time)
    :precondition (and
                    (not (busy ?p ?t1))
                    (not (busy ?p ?t2))
                    (consecutive ?t1 ?t2)
                    (not (meeting_scheduled ?p))
                  )
    :effect (meeting_scheduled ?p)
  )
)