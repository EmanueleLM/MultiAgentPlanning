(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )
  (:init
    (is-slot s_09_00) (is-slot s_09_30) (is-slot s_10_00) (is-slot s_10_30)
    (is-slot s_11_00) (is-slot s_11_30) (is-slot s_12_00) (is-slot s_12_30)
    (is-slot s_13_00) (is-slot s_13_30) (is-slot s_14_00) (is-slot s_14_30)
    (is-slot s_15_00) (is-slot s_15_30) (is-slot s_16_00) (is-slot s_16_30)

    (free diane s_09_00)
    (free diane s_10_00) (free diane s_10_30)
    (free diane s_11_00) (free diane s_11_30)
    (free diane s_12_00) (free diane s_12_30)
    (free diane s_13_00) (free diane s_13_30)
    (free diane s_14_00)
    (free diane s_15_00) (free diane s_15_30)
    (free diane s_16_00) (free diane s_16_30)

    (free jack s_09_00) (free jack s_09_30)
    (free jack s_10_00) (free jack s_10_30)
    (free jack s_11_00) (free jack s_11_30)
    (free jack s_12_00) (free jack s_12_30)
    (free jack s_13_00)
    (free jack s_14_00)
    (free jack s_15_00) (free jack s_15_30)
    (free jack s_16_00) (free jack s_16_30)

    (free eugene s_10_00)
    (free eugene s_11_30)
    (free eugene s_14_30)
    (free eugene s_16_30)

    (free patricia s_09_00)
    (free patricia s_10_30)
    (free patricia s_12_00)
    (free patricia s_14_00) (free patricia s_14_30)
    (free patricia s_16_30)
  )
  (:goal (scheduled))
)