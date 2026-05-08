(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    monday_09_00_09_30
    monday_09_30_10_00
    monday_10_00_10_30
    monday_10_30_11_00
    monday_11_00_11_30
    monday_11_30_12_00
    monday_12_00_12_30
    monday_12_30_13_00
    monday_13_00_13_30
    monday_13_30_14_00
    monday_14_00_14_30
    monday_14_30_15_00
    monday_15_00_15_30
    monday_15_30_16_00
    monday_16_00_16_30
    monday_16_30_17_00 - slot
  )

  (:init
    (available isabella monday_09_00_09_30)
    (available isabella monday_09_30_10_00)
    (available isabella monday_10_00_10_30)
    (available isabella monday_10_30_11_00)
    (available isabella monday_11_00_11_30)
    (available isabella monday_11_30_12_00)
    (available isabella monday_12_00_12_30)
    (available isabella monday_12_30_13_00)
    (available isabella monday_13_00_13_30)
    (available isabella monday_13_30_14_00)
    (available isabella monday_14_00_14_30)
    (available isabella monday_14_30_15_00)
    (available isabella monday_15_00_15_30)
    (available isabella monday_15_30_16_00)
    (available isabella monday_16_00_16_30)
    (available isabella monday_16_30_17_00)

    (available ronald monday_09_00_09_30)
    (available ronald monday_09_30_10_00)
    (available ronald monday_10_00_10_30)
    (available ronald monday_10_30_11_00)
    (available ronald monday_11_00_11_30)
    (available ronald monday_12_00_12_30)
    (available ronald monday_12_30_13_00)
    (available ronald monday_13_00_13_30)
    (available ronald monday_13_30_14_00)
    (available ronald monday_14_30_15_00)
    (available ronald monday_15_00_15_30)
    (available ronald monday_15_30_16_00)

    (available amanda monday_09_00_09_30)
    (available amanda monday_12_00_12_30)
    (available amanda monday_13_00_13_30)
    (available amanda monday_14_00_14_30)
    (available amanda monday_14_30_15_00)
    (available amanda monday_15_00_15_30)

    (preferred_slot monday_09_00_09_30)
    (preferred_slot monday_09_30_10_00)
    (preferred_slot monday_10_00_10_30)
    (preferred_slot monday_10_30_11_00)
    (preferred_slot monday_11_00_11_30)
    (preferred_slot monday_11_30_12_00)
    (preferred_slot monday_12_00_12_30)
    (preferred_slot monday_12_30_13_00)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)