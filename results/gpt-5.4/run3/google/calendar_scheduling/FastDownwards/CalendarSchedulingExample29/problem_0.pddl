(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    madison diana shirley - participant
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
    (required madison)
    (required diana)
    (required shirley)

    (next_slot s_09_00_09_30 s_09_30_10_00)
    (next_slot s_09_30_10_00 s_10_00_10_30)
    (next_slot s_10_00_10_30 s_10_30_11_00)
    (next_slot s_10_30_11_00 s_11_00_11_30)
    (next_slot s_11_00_11_30 s_11_30_12_00)
    (next_slot s_11_30_12_00 s_12_00_12_30)
    (next_slot s_12_00_12_30 s_12_30_13_00)
    (next_slot s_12_30_13_00 s_13_00_13_30)
    (next_slot s_13_00_13_30 s_13_30_14_00)
    (next_slot s_13_30_14_00 s_14_00_14_30)
    (next_slot s_14_00_14_30 s_14_30_15_00)
    (next_slot s_14_30_15_00 s_15_00_15_30)
    (next_slot s_15_00_15_30 s_15_30_16_00)
    (next_slot s_15_30_16_00 s_16_00_16_30)
    (next_slot s_16_00_16_30 s_16_30_17_00)

    (start_candidate s_09_00_09_30)
    (start_candidate s_09_30_10_00)
    (start_candidate s_10_00_10_30)
    (start_candidate s_10_30_11_00)
    (start_candidate s_11_00_11_30)
    (start_candidate s_11_30_12_00)
    (start_candidate s_12_00_12_30)
    (start_candidate s_12_30_13_00)
    (start_candidate s_13_00_13_30)
    (start_candidate s_13_30_14_00)
    (start_candidate s_14_00_14_30)
    (start_candidate s_14_30_15_00)
    (start_candidate s_15_00_15_30)
    (start_candidate s_15_30_16_00)
    (start_candidate s_16_00_16_30)

    (busy madison s_09_30_10_00)
    (busy madison s_11_30_12_00)
    (free madison s_09_00_09_30)
    (free madison s_10_00_10_30)
    (free madison s_10_30_11_00)
    (free madison s_11_00_11_30)
    (free madison s_12_00_12_30)
    (free madison s_12_30_13_00)
    (free madison s_13_00_13_30)
    (free madison s_13_30_14_00)
    (free madison s_14_00_14_30)
    (free madison s_14_30_15_00)
    (free madison s_15_00_15_30)
    (free madison s_15_30_16_00)
    (free madison s_16_00_16_30)
    (free madison s_16_30_17_00)

    (busy diana s_11_00_11_30)
    (busy diana s_13_00_13_30)
    (free diana s_09_00_09_30)
    (free diana s_09_30_10_00)
    (free diana s_10_00_10_30)
    (free diana s_10_30_11_00)
    (free diana s_11_30_12_00)
    (free diana s_12_00_12_30)
    (free diana s_12_30_13_00)
    (free diana s_13_30_14_00)
    (free diana s_14_00_14_30)
    (free diana s_14_30_15_00)
    (free diana s_15_00_15_30)
    (free diana s_15_30_16_00)
    (free diana s_16_00_16_30)
    (free diana s_16_30_17_00)

    (busy shirley s_09_00_09_30)
    (busy shirley s_09_30_10_00)
    (busy shirley s_10_00_10_30)
    (busy shirley s_10_30_11_00)
    (busy shirley s_11_00_11_30)
    (busy shirley s_11_30_12_00)
    (busy shirley s_13_30_14_00)
    (busy shirley s_14_00_14_30)
    (busy shirley s_14_30_15_00)
    (busy shirley s_15_30_16_00)
    (busy shirley s_16_00_16_30)
    (busy shirley s_16_30_17_00)
    (free shirley s_12_00_12_30)
    (free shirley s_12_30_13_00)
    (free shirley s_13_00_13_30)
    (free shirley s_15_00_15_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)