(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - agent
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    ;; agents
    (agent diane) (agent jack) (agent eugene) (agent patricia)

    ;; slots (half-hour starts between 09:00 and 16:30)
    (slot s_09_00) (slot s_09_30) (slot s_10_00) (slot s_10_30)
    (slot s_11_00) (slot s_11_30) (slot s_12_00) (slot s_12_30)
    (slot s_13_00) (slot s_13_30) (slot s_14_00) (slot s_14_30)
    (slot s_15_00) (slot s_15_30) (slot s_16_00) (slot s_16_30)

    ;; free facts derived from each participant's busy intervals (only free 30-min slots are listed)
    ;; Diane: blocked 09:30-10:00, 14:30-15:00
    (free diane s_09_00)
    (free diane s_10_00) (free diane s_10_30)
    (free diane s_11_00) (free diane s_11_30)
    (free diane s_12_00) (free diane s_12_30)
    (free diane s_13_00) (free diane s_13_30)
    (free diane s_14_00)
    (free diane s_15_00) (free diane s_15_30)
    (free diane s_16_00) (free diane s_16_30)

    ;; Jack: blocked 13:30-14:00, 14:30-15:00
    (free jack s_09_00) (free jack s_09_30)
    (free jack s_10_00) (free jack s_10_30)
    (free jack s_11_00) (free jack s_11_30)
    (free jack s_12_00) (free jack s_12_30)
    (free jack s_13_00)
    (free jack s_14_00)
    (free jack s_15_00) (free jack s_15_30)
    (free jack s_16_00) (free jack s_16_30)

    ;; Eugene: blocked 09:00-10:00, 10:30-11:30, 12:00-14:30, 15:00-16:30
    (free eugene s_10_00)
    (free eugene s_11_30)
    (free eugene s_14_30)
    (free eugene s_16_30)

    ;; Patricia: blocked 09:30-10:30, 11:00-12:00, 12:30-14:00, 15:00-16:30
    (free patricia s_09_00)
    (free patricia s_10_30)
    (free patricia s_12_00)
    (free patricia s_14_00) (free patricia s_14_30)
    (free patricia s_16_30)
  )

  ;; Goal: have scheduled a meeting (the only feasible slot given constraints is s_16_30)
  (:goal (scheduled))
)