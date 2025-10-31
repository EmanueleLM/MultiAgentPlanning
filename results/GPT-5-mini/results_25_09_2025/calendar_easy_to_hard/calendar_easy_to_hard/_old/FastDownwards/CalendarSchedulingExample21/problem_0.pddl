(define (problem schedule-meeting-monday-combined)
  (:domain combined-meeting-schedule)

  (:objects
    ;; participants (kept for clarity; domain actions do not require participant objects directly)
    bobby scott kimberly - participant

    ;; Unified slot naming covering 09:00-17:00 in 30-min quanta:
    ;; slot_9_00  = 09:00-09:30, slot_9_30 = 09:30-10:00, ..., slot_16_30 = 16:30-17:00
    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; --- Bobby's availability (Agent 1): "available the entire day on Monday" ---
    (avail_bobby slot_9_00)  (avail_bobby slot_9_30)
    (avail_bobby slot_10_00) (avail_bobby slot_10_30)
    (avail_bobby slot_11_00) (avail_bobby slot_11_30)
    (avail_bobby slot_12_00) (avail_bobby slot_12_30)
    (avail_bobby slot_13_00) (avail_bobby slot_13_30)
    (avail_bobby slot_14_00) (avail_bobby slot_14_30)
    (avail_bobby slot_15_00) (avail_bobby slot_15_30)
    (avail_bobby slot_16_00) (avail_bobby slot_16_30)

    ;; --- Scott's availability (Agent 2) ---
    ;; Scott is free on all slots except:
    ;; - 11:30-12:00 (slot_11_30) -> busy
    ;; - 15:30-16:00 (slot_15_30) -> busy
    (free_scott slot_9_00)  (free_scott slot_9_30)
    (free_scott slot_10_00) (free_scott slot_10_30)
    (free_scott slot_11_00)
    ;; slot_11_30 is busy -> omitted
    (free_scott slot_12_00) (free_scott slot_12_30)
    (free_scott slot_13_00) (free_scott slot_13_30)
    (free_scott slot_14_00) (free_scott slot_14_30)
    (free_scott slot_15_00)
    ;; slot_15_30 is busy -> omitted
    (free_scott slot_16_00) (free_scott slot_16_30)

    ;; Agent 2 bookkeeping: meeting not yet scheduled by agent2
    (unscheduled)

    ;; --- Kimberly's availability (Agent 3) ---
    ;; From agent3: free slots are:
    ;; t09_00 t09_30 t10_00 t10_30 t12_00 t13_00 t14_00 t15_00
    ;; mapped to unified slot names:
    (free_kimberly slot_9_00)  (free_kimberly slot_9_30)
    (free_kimberly slot_10_00) (free_kimberly slot_10_30)
    (free_kimberly slot_12_00) (free_kimberly slot_13_00)
    (free_kimberly slot_14_00) (free_kimberly slot_15_00)

    ;; --- adjacency (next) relations for consecutive 30-minute slots ---
    (next slot_9_00 slot_9_30)
    (next slot_9_30 slot_10_00)
    (next slot_10_00 slot_10_30)
    (next slot_10_30 slot_11_00)
    (next slot_11_00 slot_11_30)
    (next slot_11_30 slot_12_00)
    (next slot_12_00 slot_12_30)
    (next slot_12_30 slot_13_00)
    (next slot_13_00 slot_13_30)
    (next slot_13_30 slot_14_00)
    (next slot_14_00 slot_14_30)
    (next slot_14_30 slot_15_00)
    (next slot_15_00 slot_15_30)
    (next slot_15_30 slot_16_00)
    (next slot_16_00 slot_16_30)
  )

  ;; Goal: meeting confirmed by the coordinator (finalize_meeting).
  (:goal (meeting_confirmed))
)