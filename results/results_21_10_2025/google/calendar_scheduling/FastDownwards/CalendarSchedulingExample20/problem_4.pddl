(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    (available ralph slot_09_00) (available ralph slot_09_30)
    (available ralph slot_10_00) (available ralph slot_10_30)
    (available ralph slot_11_00) (available ralph slot_11_30)
    (available ralph slot_12_00) (available ralph slot_12_30)
    (available ralph slot_13_00) (available ralph slot_14_00)
    (available ralph slot_15_00) (available ralph slot_15_30)
    (available ralph slot_16_00) (available ralph slot_16_30)

    (available peter slot_09_30) (available peter slot_10_00) (available peter slot_10_30)
    (available peter slot_13_00) (available peter slot_13_30)
    (available peter slot_14_00) (available peter slot_14_30)
    (available peter slot_15_00) (available peter slot_15_30)
    (available peter slot_16_30)

    (available daniel slot_10_00)

    ; Daniel prefers to avoid meetings after 13:30: mark slots starting at 14:00 and later as disliked
    (daniel-dislikes slot_14_00) (daniel-dislikes slot_14_30)
    (daniel-dislikes slot_15_00) (daniel-dislikes slot_15_30)
    (daniel-dislikes slot_16_00) (daniel-dislikes slot_16_30)
  )

  (:goal (scheduled-any))
  (:metric minimize (total-cost))
)