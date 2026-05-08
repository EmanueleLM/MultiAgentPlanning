(define (problem calendar_scheduling_example0_problem)
    (:domain calendar_scheduling_example0)
    (:objects
        michelle steven jerry - person
        t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
        t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
    )
    (:init
        ;; Define consecutive 30-minute time slots for the 9:00-17:00 work window
        (next_slot t_09_00 t_09_30)
        (next_slot t_09_30 t_10_00)
        (next_slot t_10_00 t_10_30)
        (next_slot t_10_30 t_11_00)
        (next_slot t_11_00 t_11_30)
        (next_slot t_11_30 t_12_00)
        (next_slot t_12_00 t_12_30)
        (next_slot t_12_30 t_13_00)
        (next_slot t_13_00 t_13_30)
        (next_slot t_13_30 t_14_00)
        (next_slot t_14_00 t_14_30)
        (next_slot t_14_30 t_15_00)
        (next_slot t_15_00 t_15_30)
        (next_slot t_15_30 t_16_00)
        (next_slot t_16_00 t_16_30) ; Latest start for 1-hour meeting is t_16_00 (ends 17:00)

        ;; Michelle's available times (blocked 11:00-12:00 -> t_11_00, t_11_30)
        (available michelle t_09_00) (available michelle t_09_30) (available michelle t_10_00) (available michelle t_10_30)
        (available michelle t_12_00) (available michelle t_12_30) (available michelle t_13_00) (available michelle t_13_30)
        (available michelle t_14_00) (available michelle t_14_30) (available michelle t_15_00) (available michelle t_15_30)
        (available michelle t_16_00) (available michelle t_16_30)

        ;; Steven's available times (blocked 9:00-9:30, 11:30-12:00, 13:30-14:00, 15:30-16:00 -> t_09_00, t_11_30, t_13_30, t_15_30)
        (available steven t_09_30) (available steven t_10_00) (available steven t_10_30) (available steven t_11_00)
        (available steven t_12_00) (available steven t_12_30) (available steven t_13_00) (available steven t_14_00)
        (available steven t_14_30) (available steven t_15_00) (available steven t_16_00) (available steven t_16_30)

        ;; Jerry's available times (blocked 9:00-9:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00 -> t_09_00, t_10_00, t_10_30, t_11_30, t_12_00, t_13_00, t_13_30, t_14_00, t_15_30, t_16_30)
        (available jerry t_09_30) (available jerry t_11_00) (available jerry t_12_30) (available jerry t_14_30)
        (available jerry t_15_00) (available jerry t_16_00)

        ;; Initial state: no meeting scheduled (meeting_scheduled is false by default under CWA)
    )
    (:goal (and
        (meeting_scheduled)
    ))
)