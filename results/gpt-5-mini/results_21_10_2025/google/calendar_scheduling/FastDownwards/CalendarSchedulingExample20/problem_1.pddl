(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    ralph peter daniel - participant

    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; Declare slots and participants
    (slot slot_09_00) (slot slot_09_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    (participant ralph) (participant peter) (participant daniel)

    ;; Availability derived from participants' schedules (30-minute start slots).
    ;; Ralph: busy 13:30-14:00 and 14:30-15:00 => unavailable at slot_13_30 and slot_14_30.
    ;; He is available at all other work slots.
    (available ralph slot_09_00) (available ralph slot_09_30)
    (available ralph slot_10_00) (available ralph slot_10_30)
    (available ralph slot_11_00) (available ralph slot_11_30)
    (available ralph slot_12_00) (available ralph slot_12_30)
    (available ralph slot_13_00) (available ralph slot_14_00)
    (available ralph slot_15_00) (available ralph slot_15_30)
    (available ralph slot_16_00) (available ralph slot_16_30)

    ;; Peter: busy 09:00-09:30, 11:00-13:00, 16:00-16:30 => unavailable at slot_09_00,
    ;; slot_11_00, slot_11_30, slot_12_00, slot_12_30, and slot_16_00.
    (available peter slot_09_30) (available peter slot_10_00) (available peter slot_10_30)
    (available peter slot_13_00) (available peter slot_13_30)
    (available peter slot_14_00) (available peter slot_14_30)
    (available peter slot_15_00) (available peter slot_15_30)
    (available peter slot_16_30)

    ;; Daniel: busy 09:00-10:00, 10:30-15:30, 16:00-17:00.
    ;; That leaves slot_10_00 (10:00-10:30) and slot_15_30 (15:30-16:00) as free.
    ;; Daniel also prefers to avoid meetings after 13:30. To respect this preference
    ;; in the planner (so the natural solution is before 13:30 when possible), we
    ;; only declare the earlier free slot (slot_10_00) as available for Daniel.
    (available daniel slot_10_00)
  )

  ;; Goal: schedule some valid slot that all participants confirm.
  ;; We use scheduled-any so the goal doesn't name a particular slot; because of
  ;; the availability constraints above, the only feasible finalized slot is slot_10_00.
  (:goal (scheduled-any))
)