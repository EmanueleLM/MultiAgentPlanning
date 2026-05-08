(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    anthony pamela zachary - participant
    s_09_00_10_00 s_09_30_10_30 s_10_00_11_00 s_10_30_11_30
    s_11_00_12_00 s_11_30_12_30 s_12_00_13_00 s_12_30_13_30
    s_13_00_14_00 s_13_30_14_30 s_14_00_15_00 s_14_30_15_30
    s_15_00_16_00 s_15_30_16_30 s_16_00_17_00 - slot
  )

  (:init
    (unscheduled)

    (one_hour_slot s_09_00_10_00)
    (one_hour_slot s_09_30_10_30)
    (one_hour_slot s_10_00_11_00)
    (one_hour_slot s_10_30_11_30)
    (one_hour_slot s_11_00_12_00)
    (one_hour_slot s_11_30_12_30)
    (one_hour_slot s_12_00_13_00)
    (one_hour_slot s_12_30_13_30)
    (one_hour_slot s_13_00_14_00)
    (one_hour_slot s_13_30_14_30)
    (one_hour_slot s_14_00_15_00)
    (one_hour_slot s_14_30_15_30)
    (one_hour_slot s_15_00_16_00)
    (one_hour_slot s_15_30_16_30)
    (one_hour_slot s_16_00_17_00)

    (pamela_acceptable s_09_00_10_00)
    (pamela_acceptable s_09_30_10_30)
    (pamela_acceptable s_10_00_11_00)
    (pamela_acceptable s_10_30_11_30)
    (pamela_acceptable s_11_00_12_00)
    (pamela_acceptable s_11_30_12_30)
    (pamela_acceptable s_12_00_13_00)
    (pamela_acceptable s_12_30_13_30)
    (pamela_acceptable s_13_00_14_00)
    (pamela_acceptable s_13_30_14_30)

    (available anthony s_10_00_11_00)
    (available anthony s_10_30_11_30)
    (available anthony s_11_00_12_00)
    (available anthony s_13_00_14_00)
    (available anthony s_13_30_14_30)
    (available anthony s_14_00_15_00)
    (available anthony s_14_30_15_30)
    (available anthony s_15_00_16_00)

    (available pamela s_10_00_11_00)
    (available pamela s_10_30_11_30)
    (available pamela s_11_00_12_00)
    (available pamela s_11_30_12_30)
    (available pamela s_12_00_13_00)
    (available pamela s_12_30_13_30)
    (available pamela s_13_00_14_00)
    (available pamela s_13_30_14_30)
    (available pamela s_14_00_15_00)
    (available pamela s_14_30_15_30)
    (available pamela s_15_00_16_00)
    (available pamela s_15_30_16_30)

    (available zachary s_13_30_14_30)
    (available zachary s_15_00_16_00)
  )

  (:goal
    (and
      (not (unscheduled))
    )
  )
)