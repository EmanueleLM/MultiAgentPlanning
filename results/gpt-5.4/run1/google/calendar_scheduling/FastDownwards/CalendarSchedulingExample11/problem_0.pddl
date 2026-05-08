(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    alexander elizabeth walter - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (within_workday s_09_00)
    (within_workday s_09_30)
    (within_workday s_10_00)
    (within_workday s_10_30)
    (within_workday s_11_00)
    (within_workday s_11_30)
    (within_workday s_12_00)
    (within_workday s_12_30)
    (within_workday s_13_00)
    (within_workday s_13_30)
    (within_workday s_14_00)
    (within_workday s_14_30)
    (within_workday s_15_00)
    (within_workday s_15_30)
    (within_workday s_16_00)
    (within_workday s_16_30)

    (busy alexander s_09_30)
    (busy alexander s_10_30)
    (busy alexander s_12_30)
    (busy alexander s_14_30)
    (busy alexander s_16_00)
    (busy alexander s_16_30)

    (busy elizabeth s_09_00)
    (busy elizabeth s_11_30)
    (busy elizabeth s_12_00)
    (busy elizabeth s_13_00)
    (busy elizabeth s_13_30)
    (busy elizabeth s_14_00)

    (busy walter s_09_00)
    (busy walter s_09_30)
    (busy walter s_10_00)
    (busy walter s_10_30)
    (busy walter s_11_00)
    (busy walter s_11_30)
    (busy walter s_12_00)
    (busy walter s_12_30)
    (busy walter s_13_00)
    (busy walter s_13_30)
    (busy walter s_14_00)
    (busy walter s_15_30)
    (busy walter s_16_00)
    (busy walter s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
      (scheduled meeting_1 s_15_00)
    )
  )
)