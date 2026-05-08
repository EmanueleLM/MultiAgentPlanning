(define (domain calendar_scheduling_example45)
  (:requirements :strips :typing)
  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (free_at ?p - participant ?t - timeslot)
    (required ?m - meeting ?p - participant)
    (earlier ?t1 - timeslot ?t2 - timeslot)
    (scheduled_at ?m - meeting ?t - timeslot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (meeting_scheduled ?m))
      (required ?m andrew)
      (required ?m grace)
      (required ?m samuel)
      (free_at andrew ?t)
      (free_at grace ?t)
      (free_at samuel ?t)
      (not (scheduled_at ?m t_0900))
      (not (scheduled_at ?m t_0930))
      (not (scheduled_at ?m t_1000))
      (not (scheduled_at ?m t_1030))
      (not (scheduled_at ?m t_1100))
      (not (scheduled_at ?m t_1130))
      (not (scheduled_at ?m t_1200))
      (not (scheduled_at ?m t_1230))
      (not (scheduled_at ?m t_1300))
      (not (scheduled_at ?m t_1330))
      (not (scheduled_at ?m t_1400))
      (not (scheduled_at ?m t_1430))
      (not (scheduled_at ?m t_1500))
      (not (scheduled_at ?m t_1530))
      (not (scheduled_at ?m t_1600))
      (not (scheduled_at ?m t_1630))
      (not (and
        (earlier t_0900 ?t)
        (free_at andrew t_0900)
        (free_at grace t_0900)
        (free_at samuel t_0900)))
      (not (and
        (earlier t_0930 ?t)
        (free_at andrew t_0930)
        (free_at grace t_0930)
        (free_at samuel t_0930)))
      (not (and
        (earlier t_1000 ?t)
        (free_at andrew t_1000)
        (free_at grace t_1000)
        (free_at samuel t_1000)))
      (not (and
        (earlier t_1030 ?t)
        (free_at andrew t_1030)
        (free_at grace t_1030)
        (free_at samuel t_1030)))
      (not (and
        (earlier t_1100 ?t)
        (free_at andrew t_1100)
        (free_at grace t_1100)
        (free_at samuel t_1100)))
      (not (and
        (earlier t_1130 ?t)
        (free_at andrew t_1130)
        (free_at grace t_1130)
        (free_at samuel t_1130)))
      (not (and
        (earlier t_1200 ?t)
        (free_at andrew t_1200)
        (free_at grace t_1200)
        (free_at samuel t_1200)))
      (not (and
        (earlier t_1230 ?t)
        (free_at andrew t_1230)
        (free_at grace t_1230)
        (free_at samuel t_1230)))
      (not (and
        (earlier t_1300 ?t)
        (free_at andrew t_1300)
        (free_at grace t_1300)
        (free_at samuel t_1300)))
      (not (and
        (earlier t_1330 ?t)
        (free_at andrew t_1330)
        (free_at grace t_1330)
        (free_at samuel t_1330)))
      (not (and
        (earlier t_1400 ?t)
        (free_at andrew t_1400)
        (free_at grace t_1400)
        (free_at samuel t_1400)))
      (not (and
        (earlier t_1430 ?t)
        (free_at andrew t_1430)
        (free_at grace t_1430)
        (free_at samuel t_1430)))
      (not (and
        (earlier t_1500 ?t)
        (free_at andrew t_1500)
        (free_at grace t_1500)
        (free_at samuel t_1500)))
      (not (and
        (earlier t_1530 ?t)
        (free_at andrew t_1530)
        (free_at grace t_1530)
        (free_at samuel t_1530)))
      (not (and
        (earlier t_1600 ?t)
        (free_at andrew t_1600)
        (free_at grace t_1600)
        (free_at samuel t_1600)))
      (not (and
        (earlier t_1630 ?t)
        (free_at andrew t_1630)
        (free_at grace t_1630)
        (free_at samuel t_1630)))
    )
    :effect (and
      (meeting_scheduled ?m)
      (scheduled_at ?m ?t)
    )
  )
)