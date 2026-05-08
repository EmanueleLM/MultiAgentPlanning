(define (problem meeting_scheduling_monday_teresa_kathleen_patricia)
  (:domain meeting_scheduling_monday_instance)

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
    (busy teresa s_09_00_09_30)
    (busy teresa s_09_30_10_00)
    (busy teresa s_13_00_13_30)
    (busy teresa s_14_00_14_30)
    (busy teresa s_15_00_15_30)
    (busy teresa s_16_30_17_00)

    (busy kathleen s_09_00_09_30)
    (busy kathleen s_12_30_13_00)
    (busy kathleen s_13_30_14_00)
    (busy kathleen s_15_00_15_30)

    (busy patricia s_09_00_09_30)
    (busy patricia s_09_30_10_00)
    (busy patricia s_10_00_10_30)
    (busy patricia s_11_30_12_00)
    (busy patricia s_13_00_13_30)
    (busy patricia s_14_00_14_30)
    (busy patricia s_15_30_16_00)
    (busy patricia s_16_30_17_00)

    (acceptable_slot s_09_00_09_30)
    (acceptable_slot s_09_30_10_00)
    (acceptable_slot s_10_00_10_30)
    (acceptable_slot s_10_30_11_00)
    (acceptable_slot s_11_00_11_30)
    (acceptable_slot s_11_30_12_00)
    (acceptable_slot s_12_00_12_30)
    (acceptable_slot s_12_30_13_00)
    (acceptable_slot s_13_00_13_30)
    (acceptable_slot s_13_30_14_00)
    (acceptable_slot s_14_00_14_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)