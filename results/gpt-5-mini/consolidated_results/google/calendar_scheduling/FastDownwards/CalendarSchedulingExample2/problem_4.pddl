(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    ;; persons
    roy kathryn amy - person

    ;; 30-minute slots from 09:00 to 17:00 (start times)
    slot_09_00_09_30 slot_09_30_10_00 slot_10_00_10_30 slot_10_30_11_00
    slot_11_00_11_30 slot_11_30_12_00 slot_12_00_12_30 slot_12_30_13_00
    slot_13_00_13_30 slot_13_30_14_00 slot_14_00_14_30 slot_14_30_15_00
    slot_15_00_15_30 slot_15_30_16_00 slot_16_00_16_30 slot_16_30_17_00
    - slot
  )

  (:init
    ;; persons
    (person roy)
    (person kathryn)
    (person amy)

    ;; ordered slots (successor relation to express the workday sequence)
    (next-slot slot_09_00_09_30 slot_09_30_10_00)
    (next-slot slot_09_30_10_00 slot_10_00_10_30)
    (next-slot slot_10_00_10_30 slot_10_30_11_00)
    (next-slot slot_10_30_11_00 slot_11_00_11_30)
    (next-slot slot_11_00_11_30 slot_11_30_12_00)
    (next-slot slot_11_30_12_00 slot_12_00_12_30)
    (next-slot slot_12_00_12_30 slot_12_30_13_00)
    (next-slot slot_12_30_13_00 slot_13_00_13_30)
    (next-slot slot_13_00_13_30 slot_13_30_14_00)
    (next-slot slot_13_30_14_00 slot_14_00_14_30)
    (next-slot slot_14_00_14_30 slot_14_30_15_00)
    (next-slot slot_14_30_15_00 slot_15_00_15_30)
    (next-slot slot_15_00_15_30 slot_15_30_16_00)
    (next-slot slot_15_30_16_00 slot_16_00_16_30)
    (next-slot slot_16_00_16_30 slot_16_30_17_00)

    ;; Hard calendar constraints (busy) derived from participants' private schedules.
    ;; Roy busy: 09:00-09:30, 10:00-10:30, 11:00-11:30, 12:30-13:00
    (busy roy slot_09_00_09_30)
    (busy roy slot_10_00_10_30)
    (busy roy slot_11_00_11_30)
    (busy roy slot_12_30_13_00)

    ;; Kathryn busy: 09:30-10:00, 16:30-17:00
    (busy kathryn slot_09_30_10_00)
    (busy kathryn slot_16_30_17_00)

    ;; Amy busy: 09:00-14:30 (covers slots starting 09:00 up to 14:00), 15:00-16:00 (15:00 and 15:30), 16:30-17:00
    (busy amy slot_09_00_09_30)
    (busy amy slot_09_30_10_00)
    (busy amy slot_10_00_10_30)
    (busy amy slot_10_30_11_00)
    (busy amy slot_11_00_11_30)
    (busy amy slot_11_30_12_00)
    (busy amy slot_12_00_12_30)
    (busy amy slot_12_30_13_00)
    (busy amy slot_13_00_13_30)
    (busy amy slot_13_30_14_00)
    (busy amy slot_14_00_14_30)
    (busy amy slot_15_00_15_30)
    (busy amy slot_15_30_16_00)
    (busy amy slot_16_30_17_00)

    ;; Complementary free facts (explicitly enumerated - hard facts derived from busy within work hours)
    ;; Roy free slots (all work slots except his busy ones)
    (free roy slot_09_30_10_00)
    (free roy slot_10_30_11_00)
    (free roy slot_11_30_12_00)
    (free roy slot_12_00_12_30)
    (free roy slot_13_00_13_30)
    (free roy slot_13_30_14_00)
    (free roy slot_14_00_14_30)
    (free roy slot_14_30_15_00)
    (free roy slot_15_00_15_30)
    (free roy slot_15_30_16_00)
    (free roy slot_16_00_16_30)
    (free roy slot_16_30_17_00)

    ;; Kathryn free slots (all work slots except her busy ones)
    (free kathryn slot_09_00_09_30)
    (free kathryn slot_10_00_10_30)
    (free kathryn slot_10_30_11_00)
    (free kathryn slot_11_00_11_30)
    (free kathryn slot_11_30_12_00)
    (free kathryn slot_12_00_12_30)
    (free kathryn slot_12_30_13_00)
    (free kathryn slot_13_00_13_30)
    (free kathryn slot_13_30_14_00)
    (free kathryn slot_14_00_14_30)
    (free kathryn slot_14_30_15_00)
    (free kathryn slot_15_00_15_30)
    (free kathryn slot_15_30_16_00)
    (free kathryn slot_16_00_16_30)

    ;; Amy free slots (derived from her busy intervals)
    (free amy slot_14_30_15_00)
    (free amy slot_16_00_16_30)

    ;; Intersection of free slots across all participants (auditor validated candidate slots)
    (free-all slot_14_30_15_00)
    (free-all slot_16_00_16_30)

    ;; Soft-preference resolution (auditor/orchestrator): Amy would rather not meet after 15:30.
    ;; Resolve soft preference by restricting allowed slots to the earliest candidate that does not violate it.
    (allowed slot_14_30_15_00)
  )

  (:goal (meeting-scheduled))
)