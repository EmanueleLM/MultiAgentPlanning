(define (problem schedule_meeting_michelle_steven_jerry_monday)
  (:domain meeting_schedule_michelle_steven_jerry)

  (:objects
    michelle steven jerry - participant
    meeting_michelle_steven_jerry - meeting

    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - halfhour

    w_09_00_10_00 w_09_30_10_30 w_10_00_11_00 w_10_30_11_30 w_11_00_12_00
    w_11_30_12_30 w_12_00_13_00 w_12_30_13_30 w_13_00_14_00 w_13_30_14_30
    w_14_00_15_00 w_14_30_15_30 w_15_00_16_00 w_15_30_16_30 w_16_00_17_00 - window
  )

  (:init
    (requires_participant meeting_michelle_steven_jerry michelle)
    (requires_participant meeting_michelle_steven_jerry steven)
    (requires_participant meeting_michelle_steven_jerry jerry)

    (window_first_half w_09_00_10_00 t_09_00)
    (window_second_half w_09_00_10_00 t_09_30)

    (window_first_half w_09_30_10_30 t_09_30)
    (window_second_half w_09_30_10_30 t_10_00)

    (window_first_half w_10_00_11_00 t_10_00)
    (window_second_half w_10_00_11_00 t_10_30)

    (window_first_half w_10_30_11_30 t_10_30)
    (window_second_half w_10_30_11_30 t_11_00)

    (window_first_half w_11_00_12_00 t_11_00)
    (window_second_half w_11_00_12_00 t_11_30)

    (window_first_half w_11_30_12_30 t_11_30)
    (window_second_half w_11_30_12_30 t_12_00)

    (window_first_half w_12_00_13_00 t_12_00)
    (window_second_half w_12_00_13_00 t_12_30)

    (window_first_half w_12_30_13_30 t_12_30)
    (window_second_half w_12_30_13_30 t_13_00)

    (window_first_half w_13_00_14_00 t_13_00)
    (window_second_half w_13_00_14_00 t_13_30)

    (window_first_half w_13_30_14_30 t_13_30)
    (window_second_half w_13_30_14_30 t_14_00)

    (window_first_half w_14_00_15_00 t_14_00)
    (window_second_half w_14_00_15_00 t_14_30)

    (window_first_half w_14_30_15_30 t_14_30)
    (window_second_half w_14_30_15_30 t_15_00)

    (window_first_half w_15_00_16_00 t_15_00)
    (window_second_half w_15_00_16_00 t_15_30)

    (window_first_half w_15_30_16_30 t_15_30)
    (window_second_half w_15_30_16_30 t_16_00)

    (window_first_half w_16_00_17_00 t_16_00)
    (window_second_half w_16_00_17_00 t_16_30)

    (free michelle t_09_00)
    (free michelle t_09_30)
    (free michelle t_10_00)
    (free michelle t_10_30)
    (free michelle t_12_00)
    (free michelle t_12_30)
    (free michelle t_13_00)
    (free michelle t_13_30)
    (free michelle t_14_00)
    (free michelle t_14_30)
    (free michelle t_15_00)
    (free michelle t_15_30)
    (free michelle t_16_00)
    (free michelle t_16_30)

    (free steven t_09_30)
    (free steven t_10_00)
    (free steven t_10_30)
    (free steven t_11_00)
    (free steven t_12_00)
    (free steven t_12_30)
    (free steven t_13_00)
    (free steven t_14_00)
    (free steven t_14_30)
    (free steven t_15_00)
    (free steven t_16_00)
    (free steven t_16_30)

    (free jerry t_09_30)
    (free jerry t_11_00)
    (free jerry t_12_30)
    (free jerry t_14_30)
    (free jerry t_15_00)
    (free jerry t_16_00)

    (unscheduled meeting_michelle_steven_jerry)

    (window_feasible_for_meeting meeting_michelle_steven_jerry w_14_30_15_30)
  )

  (:goal
    (and
      (scheduled meeting_michelle_steven_jerry)
      (scheduled_in meeting_michelle_steven_jerry w_14_30_15_30)
    )
  )
)