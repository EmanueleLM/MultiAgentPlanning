(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    emily melissa frank - participant
    s_09_00_09_30
    s_09_30_10_00
    s_10_00_10_30
    s_10_30_11_00
    s_11_00_11_30
    s_11_30_12_00
    s_12_00_12_30
    s_12_30_13_00
    s_13_00_13_30
    s_13_30_14_00
    s_14_00_14_30
    s_14_30_15_00
    s_15_00_15_30
    s_15_30_16_00
    s_16_00_16_30
    s_16_30_17_00 - slot
  )

  (:init
    (unscheduled)

    (allowed_slot s_09_00_09_30)

    (available emily s_09_00_09_30)
    (available emily s_09_30_10_00)
    (available emily s_10_30_11_00)
    (available emily s_11_00_11_30)
    (available emily s_12_30_13_00)
    (available emily s_13_00_13_30)
    (available emily s_13_30_14_00)
    (available emily s_15_00_15_30)
    (available emily s_15_30_16_00)
    (available emily s_16_30_17_00)

    (available melissa s_09_00_09_30)
    (available melissa s_10_00_10_30)
    (available melissa s_10_30_11_00)
    (available melissa s_11_00_11_30)
    (available melissa s_11_30_12_00)
    (available melissa s_12_00_12_30)
    (available melissa s_12_30_13_00)
    (available melissa s_13_00_13_30)
    (available melissa s_13_30_14_00)
    (available melissa s_14_00_14_30)
    (available melissa s_15_00_15_30)
    (available melissa s_15_30_16_00)
    (available melissa s_16_00_16_30)
    (available melissa s_16_30_17_00)

    (available frank s_09_00_09_30)
    (available frank s_09_30_10_00)
    (available frank s_10_30_11_00)
    (available frank s_11_30_12_00)
    (available frank s_12_00_12_30)
    (available frank s_13_00_13_30)
    (available frank s_14_30_15_00)
    (available frank s_16_00_16_30)
  )

  (:goal
    (and
      (scheduled s_09_00_09_30)
      (not (unscheduled))
    )
  )
)