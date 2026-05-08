(define (problem calendar_scheduling_example25_problem)
  (:domain calendar_scheduling_example25)

  (:objects
    s_09_00_10_00
    s_09_30_10_30
    s_10_00_11_00
    s_10_30_11_30
    s_11_00_12_00
    s_11_30_12_30
    s_12_00_13_00
    s_12_30_13_30
    s_13_00_14_00
    s_13_30_14_30
    s_14_00_15_00
    s_14_30_15_30
    s_15_00_16_00
    s_15_30_16_30
    s_16_00_17_00 - slot
  )

  (:init
    (allowed_for_pamela s_09_00_10_00)
    (allowed_for_pamela s_09_30_10_30)
    (allowed_for_pamela s_10_00_11_00)
    (allowed_for_pamela s_10_30_11_30)
    (allowed_for_pamela s_11_00_12_00)
    (allowed_for_pamela s_11_30_12_30)
    (allowed_for_pamela s_12_00_13_00)
    (allowed_for_pamela s_12_30_13_30)
    (allowed_for_pamela s_13_00_14_00)
    (allowed_for_pamela s_13_30_14_30)

    (free anthony s_10_00_11_00)
    (free anthony s_10_30_11_30)
    (free anthony s_11_00_12_00)
    (free anthony s_13_00_14_00)
    (free anthony s_13_30_14_30)
    (free anthony s_14_00_15_00)
    (free anthony s_14_30_15_30)
    (free anthony s_15_00_16_00)

    (free pamela s_10_00_11_00)
    (free pamela s_10_30_11_30)
    (free pamela s_11_00_12_00)
    (free pamela s_11_30_12_30)
    (free pamela s_12_00_13_00)
    (free pamela s_12_30_13_30)
    (free pamela s_13_00_14_00)
    (free pamela s_13_30_14_30)
    (free pamela s_14_00_15_00)
    (free pamela s_14_30_15_30)
    (free pamela s_15_00_16_00)
    (free pamela s_15_30_16_30)

    (free zachary s_13_30_14_30)
    (free zachary s_15_00_16_00)
  )

  (:goal
    (or
      (chosen s_09_00_10_00)
      (chosen s_09_30_10_30)
      (chosen s_10_00_11_00)
      (chosen s_10_30_11_30)
      (chosen s_11_00_12_00)
      (chosen s_11_30_12_30)
      (chosen s_12_00_13_00)
      (chosen s_12_30_13_30)
      (chosen s_13_00_14_00)
      (chosen s_13_30_14_30)
      (chosen s_14_00_15_00)
      (chosen s_14_30_15_30)
      (chosen s_15_00_16_00)
      (chosen s_15_30_16_30)
      (chosen s_16_00_17_00)
    )
  )
)