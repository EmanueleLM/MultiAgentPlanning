(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:predicates
    (busy ?p - person ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:functions (total-cost))

  (:action schedule-09-00
    :parameters ()
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

  (:action schedule-09-30
    :parameters ()
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

  (:action schedule-10-00
    :parameters ()
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

  (:action schedule-10-30
    :parameters ()
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

  (:action schedule-11-00
    :parameters ()
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

  (:action schedule-11-30
    :parameters ()
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

  (:action schedule-12-00
    :parameters ()
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

  (:action schedule-12-30
    :parameters ()
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

  (:action schedule-13-00
    :parameters ()
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

  (:action schedule-13-30
    :parameters ()
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

  (:action schedule-14-00
    :parameters ()
    :precondition (and
      (not (busy heather s14-00))
      (not (busy nicholas s14-00))
      (not (busy zachary s14-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s14-00)
      (increase (total-cost) 11)
    )
  )

  (:action schedule-14-30
    :parameters ()
    :precondition (and
      (not (busy heather s14-30))
      (not (busy nicholas s14-30))
      (not (busy zachary s14-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s14-30)
      (increase (total-cost) 12)
    )
  )

  (:action schedule-15-00
    :parameters ()
    :precondition (and
      (not (busy heather s15-00))
      (not (busy nicholas s15-00))
      (not (busy zachary s15-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s15-00)
      (increase (total-cost) 13)
    )
  )

  (:action schedule-15-30
    :parameters ()
    :precondition (and
      (not (busy heather s15-30))
      (not (busy nicholas s15-30))
      (not (busy zachary s15-30))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s15-30)
      (increase (total-cost) 14)
    )
  )

  (:action schedule-16-00
    :parameters ()
    :precondition (and
      (not (busy heather s16-00))
      (not (busy nicholas s16-00))
      (not (busy zachary s16-00))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at s16-00)
      (increase (total-cost) 15)
    )
  )

)