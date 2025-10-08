(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:predicates
    (busy ?p - person ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:functions (total-cost))

  ;; Actions: schedule at each 30-min slot from 09:00 up to 13:30.
  ;; Zachary's hard preference disallows scheduling at or after 14:00,
  ;; so slots 14:00+ are not provided as schedule actions.
  ;; Each action requires that all participants are not busy at that slot
  ;; and that no meeting is already scheduled. Costs increase with later slots
  ;; so the planner prefers the earliest feasible slot.

  (:action schedule-09:00
    :precondition (and
      (not (busy heather s09-00))
      (not (busy nicholas s09-00))
      (not (busy zachary s09-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s09-00)
      (increase (total-cost) 1)
    )
  )

  (:action schedule-09:30
    :precondition (and
      (not (busy heather s09-30))
      (not (busy nicholas s09-30))
      (not (busy zachary s09-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s09-30)
      (increase (total-cost) 2)
    )
  )

  (:action schedule-10:00
    :precondition (and
      (not (busy heather s10-00))
      (not (busy nicholas s10-00))
      (not (busy zachary s10-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s10-00)
      (increase (total-cost) 3)
    )
  )

  (:action schedule-10:30
    :precondition (and
      (not (busy heather s10-30))
      (not (busy nicholas s10-30))
      (not (busy zachary s10-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s10-30)
      (increase (total-cost) 4)
    )
  )

  (:action schedule-11:00
    :precondition (and
      (not (busy heather s11-00))
      (not (busy nicholas s11-00))
      (not (busy zachary s11-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s11-00)
      (increase (total-cost) 5)
    )
  )

  (:action schedule-11:30
    :precondition (and
      (not (busy heather s11-30))
      (not (busy nicholas s11-30))
      (not (busy zachary s11-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s11-30)
      (increase (total-cost) 6)
    )
  )

  (:action schedule-12:00
    :precondition (and
      (not (busy heather s12-00))
      (not (busy nicholas s12-00))
      (not (busy zachary s12-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s12-00)
      (increase (total-cost) 7)
    )
  )

  (:action schedule-12:30
    :precondition (and
      (not (busy heather s12-30))
      (not (busy nicholas s12-30))
      (not (busy zachary s12-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s12-30)
      (increase (total-cost) 8)
    )
  )

  (:action schedule-13:00
    :precondition (and
      (not (busy heather s13-00))
      (not (busy nicholas s13-00))
      (not (busy zachary s13-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s13-00)
      (increase (total-cost) 9)
    )
  )

  (:action schedule-13:30
    :precondition (and
      (not (busy heather s13-30))
      (not (busy nicholas s13-30))
      (not (busy zachary s13-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s13-30)
      (increase (total-cost) 10)
    )
  )

)