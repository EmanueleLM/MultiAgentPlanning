(define (domain calendar_scheduling_example15)
  (:requirements :strips)

  (:predicates
    (free_t1200_1230)
    (free_t1230_1300)
    (free_t1300_1330)
    (free_t1600_1630)
    (scheduled_t1200_1230)
    (scheduled_t1230_1300)
    (scheduled_t1300_1330)
    (scheduled_t1600_1630)
  )

  (:action schedule_t1200_1230
    :precondition
      (and
        (free_t1200_1230)
        (not (scheduled_t1200_1230))
        (not (scheduled_t1230_1300))
        (not (scheduled_t1300_1330))
        (not (scheduled_t1600_1630))
      )
    :effect
      (scheduled_t1200_1230)
  )

  (:action schedule_t1230_1300
    :precondition
      (and
        (free_t1230_1300)
        (not (scheduled_t1200_1230))
        (not (scheduled_t1230_1300))
        (not (scheduled_t1300_1330))
        (not (scheduled_t1600_1630))
      )
    :effect
      (scheduled_t1230_1300)
  )

  (:action schedule_t1300_1330
    :precondition
      (and
        (free_t1300_1330)
        (not (scheduled_t1200_1230))
        (not (scheduled_t1230_1300))
        (not (scheduled_t1300_1330))
        (not (scheduled_t1600_1630))
      )
    :effect
      (scheduled_t1300_1330)
  )

  (:action schedule_t1600_1630
    :precondition
      (and
        (free_t1600_1630)
        (not (scheduled_t1200_1230))
        (not (scheduled_t1230_1300))
        (not (scheduled_t1300_1330))
        (not (scheduled_t1600_1630))
      )
    :effect
      (scheduled_t1600_1630)
  )
)