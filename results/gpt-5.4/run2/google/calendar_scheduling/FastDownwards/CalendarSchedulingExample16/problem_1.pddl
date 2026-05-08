(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
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

    (busy scott s_09_30_10_00)
    (busy scott s_10_00_10_30)
    (busy scott s_13_30_14_00)
    (busy scott s_14_30_15_00)
    (busy scott s_15_30_16_00)
    (busy scott s_16_30_17_00)

    (busy christine s_09_00_09_30)
    (busy christine s_09_30_10_00)
    (busy christine s_10_30_11_00)
    (busy christine s_11_00_11_30)
    (busy christine s_11_30_12_00)
    (busy christine s_12_00_12_30)
    (busy christine s_13_00_13_30)
    (busy christine s_13_30_14_00)
    (busy christine s_14_00_14_30)
    (busy christine s_14_30_15_00)
    (busy christine s_15_00_15_30)
    (busy christine s_15_30_16_00)
    (busy christine s_16_00_16_30)
    (busy christine s_16_30_17_00)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)