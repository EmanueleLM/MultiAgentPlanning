(define (problem calendar_scheduling_example_16_problem)
    (:domain calendar_scheduling_example_16)
    (:objects
        t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
        t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_point
    )
    (:init
        ;; Gabriel is available for all slots (9:00-17:00 as 30-min slots)
        (available gabriel t_09_00) (available gabriel t_09_30) (available gabriel t_10_00) (available gabriel t_10_30)
        (available gabriel t_11_00) (available gabriel t_11_30) (available gabriel t_12_00) (available gabriel t_12_30)
        (available gabriel t_13_00) (available gabriel t_13_30) (available gabriel t_14_00) (available gabriel t_14_30)
        (available gabriel t_15_00) (available gabriel t_15_30) (available gabriel t_16_00) (available gabriel t_16_30)

        ;; Scott's available slots (total slots minus busy periods)
        ;; Busy: 9:30-10:30 (t_09_30, t_10_00), 13:30-14:00 (t_13_30), 14:30-15:00 (t_14_30), 15:30-16:00 (t_15_30), 16:30-17:00 (t_16_30)
        (available scott t_09_00)
        (available scott t_10_30)
        (available scott t_11_00)
        (available scott t_11_30)
        (available scott t_12_00)
        (available scott t_12_30)
        (available scott t_13_00)
        (available scott t_14_00)
        (available scott t_15_00)
        (available scott t_16_00)

        ;; Christine's available slots (total slots minus busy periods)
        ;; Busy: 9:00-10:00 (t_09_00, t_09_30), 10:30-12:30 (t_10_30, t_11_00, t_11_30, t_12_00), 13:00-17:00 (t_13_00, t_13_30, t_14_00, t_14_30, t_15_00, t_15_30, t_16_00, t_16_30)
        (available christine t_10_00)
        (available christine t_12_30)
    )
    (:goal (meeting_found))
)