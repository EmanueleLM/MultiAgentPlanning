(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

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
    s_16_30_17_00 - timeslot
    meeting_1 - meeting
  )

  (:init
    (work_slot s_09_00_09_30)
    (work_slot s_09_30_10_00)
    (work_slot s_10_00_10_30)
    (work_slot s_10_30_11_00)
    (work_slot s_11_00_11_30)
    (work_slot s_11_30_12_00)
    (work_slot s_12_00_12_30)
    (work_slot s_12_30_13_00)
    (work_slot s_13_00_13_30)
    (work_slot s_13_30_14_00)
    (work_slot s_14_00_14_30)
    (work_slot s_14_30_15_00)
    (work_slot s_15_00_15_30)
    (work_slot s_15_30_16_00)
    (work_slot s_16_00_16_30)
    (work_slot s_16_30_17_00)

    (free donna s_09_00_09_30)
    (free donna s_09_30_10_00)
    (free donna s_10_00_10_30)
    (free donna s_10_30_11_00)
    (free donna s_11_00_11_30)
    (free donna s_11_30_12_00)
    (free donna s_12_00_12_30)
    (free donna s_12_30_13_00)
    (free donna s_13_00_13_30)
    (free donna s_13_30_14_00)
    (free donna s_14_30_15_00)
    (free donna s_15_00_15_30)
    (free donna s_16_00_16_30)
    (free donna s_16_30_17_00)

    (free john s_09_00_09_30)
    (free john s_09_30_10_00)
    (free john s_10_00_10_30)
    (free john s_10_30_11_00)
    (free john s_11_30_12_00)
    (free john s_12_00_12_30)
    (free john s_12_30_13_00)
    (free john s_13_00_13_30)
    (free john s_13_30_14_00)
    (free john s_14_00_14_30)
    (free john s_14_30_15_00)
    (free john s_15_00_15_30)
    (free john s_15_30_16_00)
    (free john s_16_00_16_30)

    (free billy s_10_00_10_30)
    (free billy s_14_00_14_30)
  )

  (:goal
    (scheduled meeting_1)
  )
)