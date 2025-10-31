(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    brandon other - participant

    s_11_30_12_00
    s_14_30_15_00
    s_15_00_15_30
    s_15_30_16_00
    s_16_00_16_30
    s_16_30_17_00
    - slot
  )

  (:init
    ;; Brandon's availability (treated as hard constraint: prefers to avoid before 14:30 -> unavailable then)
    (available brandon s_14_30_15_00)
    (available brandon s_15_00_15_30)
    (available brandon s_16_00_16_30)

    ;; Other participant's availability (explicitly provided)
    (available other s_11_30_12_00)
    (available other s_15_00_15_30)
    (available other s_15_30_16_00)
    (available other s_16_30_17_00)
  )

  ;; Goal: a meeting time must be chosen (one 30-minute slot that satisfies all participants)
  (:goal (meeting-scheduled))
)