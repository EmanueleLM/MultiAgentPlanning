(define (domain collective-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality)

  (:types participant time_slot)

  (:constants arthur michael samantha - participant)

  (:predicates
    (busy ?p - participant ?t - time_slot)
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled)
    (time_before ?t1 ?t2 - time_slot)
  )

  (:action mark-available
    :parameters (?p - participant ?t - time_slot)
    :precondition (and (not (busy ?p ?t)))
    :effect (available ?p ?t))

  (:action schedule-meeting
    :parameters (?t1 ?t2 - time_slot)
    :precondition (and
                    (time_before ?t1 ?t2)
                    (available arthur ?t1)
                    (available arthur ?t2)
                    (available michael ?t1)
                    (available michael ?t2)
                    (available samantha ?t1)
                    (available samantha ?t2)
                    (not (meeting_scheduled)))
    :effect (meeting_scheduled))
)