(define (problem schedule_brian_billy_patricia_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    brian billy patricia - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (required brian)
    (required billy)
    (required patricia)

    (allowed_slot s_09_00)
    (allowed_slot s_09_30)
    (allowed_slot s_10_00)
    (allowed_slot s_10_30)
    (allowed_slot s_11_00)
    (allowed_slot s_11_30)
    (allowed_slot s_12_00)
    (allowed_slot s_12_30)
    (allowed_slot s_13_00)
    (allowed_slot s_13_30)
    (allowed_slot s_14_00)
    (allowed_slot s_14_30)
    (allowed_slot s_15_00)
    (allowed_slot s_15_30)

    (busy billy s_10_00)
    (busy billy s_11_30)
    (busy billy s_14_00)
    (busy billy s_16_30)

    (busy patricia s_09_00)
    (busy patricia s_09_30)
    (busy patricia s_10_00)
    (busy patricia s_10_30)
    (busy patricia s_11_00)
    (busy patricia s_11_30)
    (busy patricia s_12_00)
    (busy patricia s_13_30)
    (busy patricia s_14_30)
    (busy patricia s_15_00)
    (busy patricia s_15_30)
    (busy patricia s_16_30)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)