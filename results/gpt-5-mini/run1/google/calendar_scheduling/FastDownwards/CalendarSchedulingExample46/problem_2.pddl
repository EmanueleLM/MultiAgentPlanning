(define (problem schedule_meeting_arthur_theresa_carl_monday)
  (:domain jack_of_all_trades_schedule)
  (:objects
    arthur theresa carl - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )
  (:init
    ;; Arthur: busy at 9:30 and 14:00 -> free at all other listed slots
    (free_at arthur t_09_00)
    (free_at arthur t_10_00)
    (free_at arthur t_10_30)
    (free_at arthur t_11_00)
    (free_at arthur t_11_30)
    (free_at arthur t_12_00)
    (free_at arthur t_12_30)
    (free_at arthur t_13_00)
    (free_at arthur t_13_30)
    (free_at arthur t_14_30)
    (free_at arthur t_15_00)
    (free_at arthur t_15_30)
    (free_at arthur t_16_00)
    (free_at arthur t_16_30)

    ;; Theresa: busy at 9:00, 12:00-12:30, 15:00-16:00 -> free at remaining slots
    (free_at theresa t_09_30)
    (free_at theresa t_10_00)
    (free_at theresa t_10_30)
    (free_at theresa t_11_00)
    (free_at theresa t_11_30)
    (free_at theresa t_13_00)
    (free_at theresa t_13_30)
    (free_at theresa t_14_00)
    (free_at theresa t_14_30)
    (free_at theresa t_16_30)

    ;; Carl: busy 9:00-11:00, 12:00-13:30, 14:30-17:00 (interpreted per 30-min slots)
    ;; free only at 11:30 and 14:00 in the given discretization
    (free_at carl t_11_30)
    (free_at carl t_14_00)
  )
  ;; The requested meeting time (30 minutes) is represented by a single 30-minute slot.
  (:goal (meeting_at t_11_30))
)