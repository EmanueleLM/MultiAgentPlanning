(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
  )

  (:init
    (busy catherine s_10_30)
    (busy catherine s_12_30)
    (busy catherine s_13_00)
    (busy catherine s_14_30)

    (busy michael s_09_30)
    (busy michael s_10_00)
    (busy michael s_12_00)
    (busy michael s_12_30)
    (busy michael s_13_30)
    (busy michael s_15_00)

    (busy alexander s_09_00)
    (busy alexander s_10_00)
    (busy alexander s_11_00)
    (busy alexander s_11_30)
    (busy alexander s_13_00)
    (busy alexander s_14_00)
    (busy alexander s_14_30)
    (busy alexander s_15_00)
    (busy alexander s_15_30)
    (busy alexander s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled s_16_00)
    )
  )
)