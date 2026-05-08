(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades_scheduling)

  (:objects
    willie richard noah - person
    t_9_00 t_9_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 - timeslot
  )

  (:init
    (successor t_9_00 t_9_30)
    (successor t_9_30 t_10_00)
    (successor t_10_00 t_10_30)
    (successor t_10_30 t_11_00)
    (successor t_11_00 t_11_30)
    (successor t_11_30 t_12_00)
    (successor t_12_00 t_12_30)
    (successor t_12_30 t_13_00)
    (successor t_13_00 t_13_30)
    (successor t_13_30 t_14_00)
    (successor t_14_00 t_14_30)
    (successor t_14_30 t_15_00)
    (successor t_15_00 t_15_30)
    (successor t_15_30 t_16_00)

    ;; willie is free all listed slots
    (free willie t_9_00) (free willie t_9_30) (free willie t_10_00) (free willie t_10_30)
    (free willie t_11_00) (free willie t_11_30) (free willie t_12_00) (free willie t_12_30)
    (free willie t_13_00) (free willie t_13_30) (free willie t_14_00) (free willie t_14_30)
    (free willie t_15_00) (free willie t_15_30) (free willie t_16_00)

    ;; richard busy: 10:00-10:30 (t_10_00), 11:00-12:00 (t_11_00,t_11_30), 13:00-14:00 (t_13_00,t_13_30), 16:00-16:30 (t_16_00)
    ;; so free at remaining slots
    (free richard t_9_00) (free richard t_9_30) (free richard t_10_30)
    (free richard t_12_00) (free richard t_12_30)
    (free richard t_14_00) (free richard t_14_30)
    (free richard t_15_00) (free richard t_15_30)

    ;; noah busy: 10:00-10:30 (t_10_00), 11:30-13:00 (t_11_30,t_12_00,t_12_30), 13:30-14:00 (t_13_30), 14:30-17:00 (t_14_30,t_15_00,t_15_30,t_16_00)
    ;; so free at remaining slots
    (free noah t_9_00) (free noah t_9_30) (free noah t_10_30)
    (free noah t_11_00) (free noah t_13_00) (free noah t_14_00)
  )

  (:goal (meeting_scheduled))
)