(define (problem calendar_scheduling_example15_problem)
  (:domain calendar_scheduling_example15)

  (:objects
    joyce christine alexander - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (free joyce s_09_00)
    (free joyce s_09_30)
    (free joyce s_10_00)
    (free joyce s_10_30)
    (free joyce s_11_30)
    (free joyce s_12_00)
    (free joyce s_12_30)
    (free joyce s_13_00)
    (free joyce s_14_00)
    (free joyce s_16_30)

    (free christine s_12_00)
    (free christine s_12_30)
    (free christine s_13_00)
    (free christine s_13_30)
    (free christine s_14_00)
    (free christine s_14_30)
    (free christine s_15_00)
    (free christine s_15_30)
    (free christine s_16_00)
    (free christine s_16_30)

    (free alexander s_11_00)
    (free alexander s_11_30)
    (free alexander s_12_30)
    (free alexander s_13_00)
    (free alexander s_15_00)
    (free alexander s_16_00)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)