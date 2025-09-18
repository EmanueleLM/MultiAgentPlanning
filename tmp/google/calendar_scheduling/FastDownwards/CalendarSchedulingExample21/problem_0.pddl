(define (problem combined-schedule-monday)
  (:domain combined-meeting-scheduling)

  (:objects
    ; half-hour boundaries / start slots from 09:00 to 17:00 (start slots run 09:00..16:30)
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 s1700
  )

  (:init
    ;; Slot declarations
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630) (slot s1700)

    ;; Consecutive half-hour relations (09:00 -> 09:30 ... 16:30 -> 17:00)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630) (next s1630 s1700)

    ;; -------------------------
    ;; Bobby's availability (agent 1)
    ;; Bobby is available the entire Monday (every half-hour boundary from 09:00..16:30)
    (available-bobby s0900) (available-bobby s0930) (available-bobby s1000) (available-bobby s1030)
    (available-bobby s1100) (available-bobby s1130) (available-bobby s1200) (available-bobby s1230)
    (available-bobby s1300) (available-bobby s1330) (available-bobby s1400) (available-bobby s1430)
    (available-bobby s1500) (available-bobby s1530) (available-bobby s1600) (available-bobby s1630)

    ;; -------------------------
    ;; Scott's availability (agent 2)
    ;; Scott is busy at 11:30 (s1130) and 15:30 (s1530); all other listed slots are free.
    (free-scott s0900) (free-scott s0930) (free-scott s1000) (free-scott s1030)
    (free-scott s1100)
    ;; s1130 omitted -> busy
    (free-scott s1200) (free-scott s1230) (free-scott s1300) (free-scott s1330)
    (free-scott s1400) (free-scott s1430) (free-scott s1500)
    ;; s1530 omitted -> busy
    (free-scott s1600)
    ;; Note: Scott originally did not mention s1630/s1700; those are left absent (not free-scott)

    ;; -------------------------
    ;; Kimberly's availability (agent 3)
    ;; Kimberly busy: s1100, s1130 (11:00-12:00), s1230 (12:30-13:00), s1330 (13:30-14:00),
    ;; s1430 (14:30-15:00), s1530, s1600, s1630 (15:30-17:00).
    ;; Free at other boundaries per her model:
    (free-kimberly s0900) (free-kimberly s0930) (free-kimberly s1000) (free-kimberly s1030)
    (free-kimberly s1200) (free-kimberly s1300) (free-kimberly s1400) (free-kimberly s1500)
    (free-kimberly s1700)  ;; boundary included as in her model (cannot be a meeting start)
  )

  ;; Goal: the coordinator finalizer must produce a single meeting-scheduled fact.
  (:goal (meeting-scheduled))
)