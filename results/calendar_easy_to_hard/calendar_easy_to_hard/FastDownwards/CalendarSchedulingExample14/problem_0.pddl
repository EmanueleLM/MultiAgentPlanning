(define (problem schedule-monday)
  (:domain schedule-meeting)

  (:objects
    karen brandon donald kelly - agent
    slot-09_00_09_30 slot-09_30_10_00 slot-10_00_10_30 slot-10_30_11_00
    slot-11_00_11_30 slot-11_30_12_00 slot-12_00_12_30 slot-12_30_13_00
    slot-13_00_13_30 slot-13_30_14_00 slot-14_00_14_30 slot-14_30_15_00
    slot-15_00_15_30 slot-15_30_16_00 slot-16_00_16_30 slot-16_30_17_00
    - slot
  )

  (:init
    ;; karen free slots (busy 09:00-10:30 and 16:30-17:00 removed)
    (free karen slot-10_30_11_00)
    (free karen slot-11_00_11_30)
    (free karen slot-11_30_12_00)
    (free karen slot-12_00_12_30)
    (free karen slot-12_30_13_00)
    (free karen slot-13_00_13_30)
    (free karen slot-13_30_14_00)
    (free karen slot-14_00_14_30)
    (free karen slot-14_30_15_00)
    (free karen slot-15_00_15_30)
    (free karen slot-15_30_16_00)
    (free karen slot-16_00_16_30)

    ;; brandon free slots (unavailable: 09:30-10:00,10:30-11:00,11:30-12:30,15:30-16:00,16:30-17:00)
    (free brandon slot-09_00_09_30)
    (free brandon slot-10_00_10_30)
    (free brandon slot-11_00_11_30)
    (free brandon slot-12_30_13_00)
    (free brandon slot-13_00_13_30)
    (free brandon slot-13_30_14_00)
    (free brandon slot-14_00_14_30)
    (free brandon slot-14_30_15_00)
    (free brandon slot-15_00_15_30)
    (free brandon slot-16_00_16_30)

    ;; donald free slots (unavailable: 09:00-10:30,11:00-14:00,14:30-17:00)
    (free donald slot-10_30_11_00)
    (free donald slot-14_00_14_30)

    ;; kelly free slots (unavailable: 09:00-09:30,10:30-11:00,11:30-12:00,13:30-14:00,14:30-15:30,16:00-17:00)
    (free kelly slot-09_30_10_00)
    (free kelly slot-10_00_10_30)
    (free kelly slot-11_00_11_30)
    (free kelly slot-12_00_12_30)
    (free kelly slot-12_30_13_00)
    (free kelly slot-13_00_13_30)
    (free kelly slot-14_00_14_30)
    (free kelly slot-15_30_16_00)
  )

  ;; Goal: schedule the meeting at the earliest feasible common slot (14:00-14:30)
  (:goal (scheduled slot-14_00_14_30))
)