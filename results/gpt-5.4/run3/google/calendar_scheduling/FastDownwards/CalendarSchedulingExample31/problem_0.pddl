(define (problem schedule_meeting_monday_richard_martha_kimberly)
  (:domain meeting_schedule_monday_instance)

  (:objects
    richard martha kimberly - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (requires meeting_1 richard)
    (requires meeting_1 martha)
    (requires meeting_1 kimberly)

    ; richard availability
    (available richard s_09_00)
    (available richard s_09_30)
    (available richard s_10_00)
    (available richard s_10_30)
    (available richard s_11_00)
    (available richard s_11_30)
    (available richard s_12_00)
    (available richard s_12_30)
    (available richard s_13_00)
    (available richard s_14_00)
    (available richard s_14_30)
    (available richard s_15_30)
    (available richard s_16_00)
    (available richard s_16_30)

    ; martha availability, including hard exclusion of all slots before 14:00
    (available martha s_14_00)
    (available martha s_14_30)
    (available martha s_15_00)
    (available martha s_15_30)
    (available martha s_16_00)
    (available martha s_16_30)

    ; kimberly availability
    (available kimberly s_11_00)
    (available kimberly s_12_00)
    (available kimberly s_13_00)
    (available kimberly s_13_30)
    (available kimberly s_16_00)
    (available kimberly s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)