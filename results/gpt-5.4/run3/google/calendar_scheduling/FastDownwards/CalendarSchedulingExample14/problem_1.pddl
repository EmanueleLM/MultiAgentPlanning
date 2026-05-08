(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    meeting_1 - meeting
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (requires meeting_1 brandon)
    (requires meeting_1 jerry)
    (requires meeting_1 bradley)
    (unscheduled meeting_1)

    (participant_free brandon s_09_00)
    (participant_free brandon s_09_30)
    (participant_free brandon s_10_00)
    (participant_free brandon s_10_30)
    (participant_free brandon s_11_00)
    (participant_free brandon s_11_30)
    (participant_free brandon s_12_00)
    (participant_free brandon s_12_30)
    (participant_free brandon s_14_00)
    (participant_free brandon s_14_30)
    (participant_free brandon s_15_00)
    (participant_free brandon s_16_00)

    (participant_free jerry s_09_00)
    (participant_free jerry s_09_30)
    (participant_free jerry s_10_00)
    (participant_free jerry s_10_30)
    (participant_free jerry s_11_00)
    (participant_free jerry s_11_30)
    (participant_free jerry s_12_00)
    (participant_free jerry s_12_30)
    (participant_free jerry s_13_00)
    (participant_free jerry s_13_30)
    (participant_free jerry s_14_00)
    (participant_free jerry s_14_30)
    (participant_free jerry s_15_00)
    (participant_free jerry s_15_30)
    (participant_free jerry s_16_00)
    (participant_free jerry s_16_30)

    (participant_free bradley s_11_30)
    (participant_free bradley s_15_00)
    (participant_free bradley s_15_30)
    (participant_free bradley s_16_30)

    (allowed_for_meeting meeting_1 s_14_30)
    (allowed_for_meeting meeting_1 s_15_00)
    (allowed_for_meeting meeting_1 s_15_30)
    (allowed_for_meeting meeting_1 s_16_00)
    (allowed_for_meeting meeting_1 s_16_30)
  )

  (:goal
    (and
      (not (unscheduled meeting_1))
    )
  )
)