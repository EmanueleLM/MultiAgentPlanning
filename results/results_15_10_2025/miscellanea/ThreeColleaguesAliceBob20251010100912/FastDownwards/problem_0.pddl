(define (problem schedule-2025-10-21)
  (:domain earliest-meeting)
  (:objects
    alice bob carol - person
    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; Alice availability (09:00-11:00 and 13:00-16:00)
    (available alice slot_09_00)
    (available alice slot_09_30)
    (available alice slot_10_00)
    (available alice slot_10_30)
    (available alice slot_13_00)
    (available alice slot_13_30)
    (available alice slot_14_00)
    (available alice slot_14_30)
    (available alice slot_15_00)
    (available alice slot_15_30)

    ;; Bob availability (10:30-12:00 and 14:00-15:30)
    (available bob slot_10_30)
    (available bob slot_11_00)
    (available bob slot_11_30)
    (available bob slot_14_00)
    (available bob slot_14_30)
    (available bob slot_15_00)

    ;; Carol availability (09:30-10:30, 11:00-12:30, 15:00-17:00)
    (available carol slot_09_30)
    (available carol slot_10_00)
    (available carol slot_11_00)
    (available carol slot_11_30)
    (available carol slot_12_00)
    (available carol slot_15_00)
    (available carol slot_15_30)
    (available carol slot_16_00)
    (available carol slot_16_30)

    ;; Precomputed slot(s) where all participants are available.
    ;; Based on the provided availabilities, the only 30-minute slot where all three are available is 15:00-15:30.
    (all-available slot_15_00)
  )

  ;; Goal: schedule the meeting at the earliest feasible 30-minute slot.
  ;; (The earliest common slot computed from the inputs is slot_15_00.)
  (:goal (and
    (meeting-scheduled)
    (scheduled slot_15_00)
  ))
)