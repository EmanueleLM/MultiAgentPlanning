(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-30min)

  ; Objects: participants, discretized 30-minute start slots between 09:00 and 16:00 (inclusive),
  ; and a single meeting to schedule.
  (:objects
    stephen edward angela - participant
    slot_09_00 slot_09_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 - slot
    meeting1 - meeting
  )

  ; Comments / assumptions:
  ; ; Time granularity: 30 minutes. Valid meeting start slots are every 30 minutes from 09:00 to 16:00.
  ; ; Meeting duration: 60 minutes (two consecutive 30-minute slots). To simplify encoding,
  ; ; "available" facts indicate that a participant is available for the entire 60-minute interval
  ; ; starting at the named slot (i.e., both half-hour subslots).
  ; ;
  ; ; Private schedules (given) were converted into these per-slot availability facts.
  ; ; The planner is required to schedule meeting1 with stephen, edward, and angela present.
  ; ; Only slots where all three participants are available have all three (available ...) facts;
  ; ; therefore, the only possible schedule that meets every participant constraint is the one
  ; ; where the meeting starts at 11:30 (slot_11_30). This encoding makes any violation impossible.

  (:init
    ; Declare entities
    (participant stephen) (participant edward) (participant angela)
    (slot slot_09_00) (slot slot_09_30) (slot slot_10_00) (slot slot_10_30) (slot slot_11_00)
    (slot slot_11_30) (slot slot_12_00) (slot slot_12_30) (slot slot_13_00) (slot slot_13_30)
    (slot slot_14_00) (slot slot_14_30) (slot slot_15_00) (slot slot_15_30) (slot slot_16_00)
    (meeting meeting1)

    ; ---------------------------
    ; Per-participant availability for full 60-minute slots (start times).
    ; Each (available P S) means P is free for the entire 60-minute interval starting at S.
    ; These were computed from the private busy intervals in the specification.
    ; ---------------------------

    ; Stephen's available 60-minute start slots:
    (available stephen slot_09_00)
    (available stephen slot_10_30)
    (available stephen slot_11_00)
    (available stephen slot_11_30)
    (available stephen slot_12_00)
    (available stephen slot_13_30)
    (available stephen slot_15_00)

    ; Edward's available 60-minute start slots:
    (available edward slot_10_30)
    (available edward slot_11_00)
    (available edward slot_11_30)
    (available edward slot_12_00)
    (available edward slot_12_30)
    (available edward slot_16_00)

    ; Angela's available 60-minute start slots:
    (available angela slot_11_30)

    ; Note: No (available ...) facts are provided for slots where a participant is busy
    ; for any portion of the corresponding 60-minute meeting interval.
  )

  ; Goal: mark the meeting as scheduled. The only way to achieve this (given the preconditions)
  ; is to run schedule-meeting on a slot where all three participants are available.
  ; With the availability facts above, the only slot satisfying all three (available ...)
  ; preconditions is slot_11_30 (11:30-12:30).
  (:goal (scheduled meeting1))
)