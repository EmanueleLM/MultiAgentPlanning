(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    roy kathryn amy - participant
    mon_09_00 mon_09_30 mon_10_00 mon_10_30 mon_11_00 mon_11_30 mon_12_00 mon_12_30 mon_13_00 mon_13_30 mon_14_00 mon_14_30 mon_15_00 mon_15_30 mon_16_00 mon_16_30 - slot
    target_meeting - meeting
  )

  (:init
    (meeting_unscheduled target_meeting)

    (busy roy mon_09_00)
    (busy roy mon_10_00)
    (busy roy mon_11_00)
    (busy roy mon_12_30)

    (busy kathryn mon_09_30)
    (busy kathryn mon_16_30)

    (busy amy mon_09_00)
    (busy amy mon_09_30)
    (busy amy mon_10_00)
    (busy amy mon_10_30)
    (busy amy mon_11_00)
    (busy amy mon_11_30)
    (busy amy mon_12_00)
    (busy amy mon_12_30)
    (busy amy mon_13_00)
    (busy amy mon_13_30)
    (busy amy mon_14_00)
    (busy amy mon_15_00)
    (busy amy mon_15_30)
    (busy amy mon_16_30)

    (forbidden mon_16_00)
    (forbidden mon_16_30)
  )

  (:goal
    (and
      (scheduled_somewhere target_meeting)
      (scheduled target_meeting mon_14_30)
    )
  )
)