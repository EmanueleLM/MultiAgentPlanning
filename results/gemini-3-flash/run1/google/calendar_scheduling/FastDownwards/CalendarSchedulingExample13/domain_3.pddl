(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (is_preferred_time ?s - slot)
    (meeting_scheduled)
  )

  ;; The meeting must be scheduled in a slot where all participants are free
  ;; and we prioritize the preference by making it a structural constraint.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
      (is_preferred_time ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)