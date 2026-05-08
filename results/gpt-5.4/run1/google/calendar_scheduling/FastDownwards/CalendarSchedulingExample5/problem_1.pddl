(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
    meeting_1 - meeting
  )

  (:init
    (meeting_unscheduled meeting_1)

    (allowed_slot s_09_00)
    (allowed_slot s_09_30)
    (allowed_slot s_10_00)
    (allowed_slot s_10_30)
    (allowed_slot s_11_00)
    (allowed_slot s_11_30)
    (allowed_slot s_12_00)
    (allowed_slot s_12_30)
    (allowed_slot s_13_00)
    (allowed_slot s_13_30)

    (free kathryn s_09_30)
    (free kathryn s_10_00)
    (free kathryn s_11_00)
    (free kathryn s_12_00)
    (free kathryn s_12_30)
    (free kathryn s_13_00)
    (free kathryn s_14_30)
    (free kathryn s_15_00)
    (free kathryn s_15_30)
    (free kathryn s_16_00)

    (free charlotte s_09_00)
    (free charlotte s_09_30)
    (free charlotte s_10_00)
    (free charlotte s_10_30)
    (free charlotte s_11_00)
    (free charlotte s_11_30)
    (free charlotte s_12_30)
    (free charlotte s_13_00)
    (free charlotte s_13_30)
    (free charlotte s_14_00)
    (free charlotte s_14_30)
    (free charlotte s_15_00)
    (free charlotte s_15_30)
    (free charlotte s_16_30)

    (free lauren s_10_00)
    (free lauren s_10_30)
    (free lauren s_11_00)
    (free lauren s_11_30)
    (free lauren s_12_30)
    (free lauren s_13_00)
    (free lauren s_14_30)
    (free lauren s_16_00)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)