(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling)

  (:objects
    willie - willie_type
    richard - richard_type
    noah - noah_type
    t_9_00 t_9_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
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
    (successor t_16_00 t_16_30)

    ;; willie is free all listed slots
    (free willie t_9_00) (free willie t_9_30) (free willie t_10_00) (free willie t_10_30)
    (free willie t_11_00) (free willie t_11_30) (free willie t_12_00) (free willie t_12_30)
    (free willie t_13_00) (free willie t_13_30) (free willie t_14_00) (free willie t_14_30)
    (free willie t_15_00) (free willie t_15_30) (free willie t_16_00) (free willie t_16_30)

    ;; richard busy at: t_10_00, t_11_00, t_11_30, t_13_00, t_13_30, t_16_00
    ;; richard free at remaining listed slots
    (free richard t_9_00) (free richard t_9_30) (free richard t_10_30)
    (free richard t_12_00) (free richard t_12_30)
    (free richard t_14_00) (free richard t_14_30)
    (free richard t_15_00) (free richard t_15_30) (free richard t_16_30)

    ;; noah busy at: t_10_00, t_11_30, t_12_00, t_12_30, t_13_30, t_14_30, t_15_00, t_15_30, t_16_00, t_16_30
    ;; noah free at remaining listed slots
    (free noah t_9_00) (free noah t_9_30) (free noah t_10_30)
    (free noah t_11_00) (free noah t_13_00) (free noah t_14_00)
  )

  (:goal (meeting_scheduled))
)