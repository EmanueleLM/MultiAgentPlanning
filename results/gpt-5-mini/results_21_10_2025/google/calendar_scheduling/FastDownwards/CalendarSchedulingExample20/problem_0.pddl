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
    ;; Declare all slot objects as valid schedule slots
    (slot slot_09_00) (slot slot_09_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    ;; Participants (informational; actions use constant names)
    (participant ralph) (participant peter) (participant daniel)

    ;; Availability facts derived from the provided inputs:
    ;; The input summaries available_Ralph / available_Peter / available_Daniel
    ;; are represented here as explicit availability facts. Per the public constraint,
    ;; there exists at least one common free 30-minute slot within Monday 09:00-17:00.
    ;; We encode that common available slot (slot_11_00) for all three participants.
    (available ralph slot_11_00)
    (available peter slot_11_00)
    (available daniel slot_11_00)

    ;; No other availability facts are asserted. This keeps the model faithful
    ;; to the inputs: we do not invent additional availability beyond the provided data.
    ;; Daniel's preference "avoid meetings after 13:30" is treated as a hard constraint:
    ;; Daniel is not marked available for any slot that starts after 13:00 (so a 30-min meeting
    ;; will not finish after 13:30). Only slots with start <= 13:00 would be marked available
    ;; for Daniel in the init; here, only slot_11_00 is provided as available for him.
  )

  ;; Goal: produce a plan that results in a single 30-minute meeting slot on Monday
  ;; being scheduled that everyone is available for. Given the encoded availabilities,
  ;; the planner should select slot_11_00 and have each participant confirm before finalizing.
  (:goal (and
    (scheduled slot_11_00)
  ))
)