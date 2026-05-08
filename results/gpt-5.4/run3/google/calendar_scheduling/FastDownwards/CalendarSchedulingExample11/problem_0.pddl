(define (problem monday_meeting_instance_1)
  (:domain monday_meeting_scheduling)

  (:objects
    alexander elizabeth walter - participant
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
    (meeting_unscheduled meeting_1)

    (available alexander s_09_00_09_30)
    (available alexander s_10_00_10_30)
    (available alexander s_11_00_11_30)
    (available alexander s_11_30_12_00)
    (available alexander s_12_00_12_30)
    (available alexander s_13_00_13_30)
    (available alexander s_13_30_14_00)
    (available alexander s_14_00_14_30)
    (available alexander s_15_00_15_30)
    (available alexander s_15_30_16_00)

    (available elizabeth s_09_30_10_00)
    (available elizabeth s_10_00_10_30)
    (available elizabeth s_10_30_11_00)
    (available elizabeth s_11_00_11_30)
    (available elizabeth s_12_30_13_00)
    (available elizabeth s_14_30_15_00)
    (available elizabeth s_15_00_15_30)
    (available elizabeth s_15_30_16_00)
    (available elizabeth s_16_00_16_30)
    (available elizabeth s_16_30_17_00)

    (available walter s_14_30_15_00)
    (available walter s_15_00_15_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
      (scheduled_at meeting_1 s_15_00_15_30)
    )
  )
)