(define (domain calendar_scheduling_example15)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (free_t1200_1230)
    (free_t1230_1300)
    (free_t1300_1330)
    (free_t1600_1630)
    (scheduled_t1200_1230)
    (scheduled_t1230_1300)
    (scheduled_t1300_1330)
    (scheduled_t1600_1630)
    (meeting_scheduled)
  )

  (:action schedule_t1200_1230
    :parameters ()
    :precondition
      (and
        (free_t1200_1230)
        (not (meeting_scheduled))
      )
    :effect
      (and
        (scheduled_t1200_1230)
        (meeting_scheduled)
      )
  )

  (:action schedule_t1230_1300
    :parameters ()
    :precondition
      (and
        (free_t1230_1300)
        (not (meeting_scheduled))
      )
    :effect
      (and
        (scheduled_t1230_1300)
        (meeting_scheduled)
      )
  )

  (:action schedule_t1300_1330
    :parameters ()
    :precondition
      (and
        (free_t1300_1330)
        (not (meeting_scheduled))
      )
    :effect
      (and
        (scheduled_t1300_1330)
        (meeting_scheduled)
      )
  )

  (:action schedule_t1600_1630
    :parameters ()
    :precondition
      (and
        (free_t1600_1630)
        (not (meeting_scheduled))
      )
    :effect
      (and
        (scheduled_t1600_1630)
        (meeting_scheduled)
      )
  )
)