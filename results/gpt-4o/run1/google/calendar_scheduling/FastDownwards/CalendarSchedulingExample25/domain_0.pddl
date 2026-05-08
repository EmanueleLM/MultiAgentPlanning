(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)

  (:predicates
    (busy ?p - participant ?s - time_slot)
    (preference_not_after_1430 ?p - participant)
    (free ?p - participant ?s - time_slot)
    (scheduled_meeting ?s - time_slot)
    (consecutive ?s1 - time_slot ?s2 - time_slot)
    (after_1430 ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - time_slot ?s2 - time_slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (not (scheduled_meeting ?s1))
      (not (scheduled_meeting ?s2))
      (forall (?p - participant)
        (and
          (free ?p ?s1)
          (free ?p ?s2)
          (not (and (preference_not_after_1430 ?p) (after_1430 ?s1)))))
    )
    :effect (and
      (scheduled_meeting ?s1)
      (scheduled_meeting ?s2))
  )
)