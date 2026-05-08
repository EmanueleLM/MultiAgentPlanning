(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    arthur theresa carl - participant
    meeting_1 - meeting
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (required meeting_1 arthur)
    (required meeting_1 theresa)
    (required meeting_1 carl)
    (unscheduled meeting_1)

    (blocked arthur s_09_30)
    (blocked arthur s_14_00)

    (blocked theresa s_09_00)
    (blocked theresa s_12_00)
    (blocked theresa s_12_30)
    (blocked theresa s_15_00)
    (blocked theresa s_15_30)
    (blocked theresa s_16_00)

    (blocked carl s_09_00)
    (blocked carl s_09_30)
    (blocked carl s_10_00)
    (blocked carl s_10_30)
    (blocked carl s_11_00)
    (blocked carl s_12_00)
    (blocked carl s_12_30)
    (blocked carl s_13_00)
    (blocked carl s_13_30)
    (blocked carl s_14_30)
    (blocked carl s_15_00)
    (blocked carl s_15_30)
    (blocked carl s_16_00)
    (blocked carl s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)