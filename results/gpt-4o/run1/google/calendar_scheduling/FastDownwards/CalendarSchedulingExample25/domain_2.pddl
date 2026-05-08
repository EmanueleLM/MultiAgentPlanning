(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)

  (:predicates
    (busy ?p - participant ?s - time_slot)
    (preference_not_after_1430 ?p - participant ?s - time_slot)
    (consecutive ?s1 - time_slot ?s2 - time_slot)
    (scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - time_slot ?s2 - time_slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (forall (?p - participant)
        (and
          (not (busy ?p ?s1))
          (not (busy ?p ?s2))
          (not (preference_not_after_1430 ?p ?s1))
          (not (preference_not_after_1430 ?p ?s2))
        )
      )
    )
    :effect (and
      (scheduled ?s1)
      (scheduled ?s2)
    )
  )
)