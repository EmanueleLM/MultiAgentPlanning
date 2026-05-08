(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:constants gerald roy barbara - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
  )

  ;; A meeting is scheduled when all required participants are free in a given slot.
  ;; We incorporate the preference as a hard constraint for the specific task solution.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free gerald ?s)
      (free roy ?s)
      (free barbara ?s)
      (is_preferred ?s)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)