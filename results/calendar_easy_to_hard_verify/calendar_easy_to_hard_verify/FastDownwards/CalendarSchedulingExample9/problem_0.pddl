(define (problem schedule-meeting-mon)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Diane's free slots (within 09:00-17:00, excluding her busy intervals 09:00-09:30, 12:00-12:30, 14:30-15:30)
    (free diane s0930)
    (free diane s1000)
    (free diane s1030)
    (free diane s1100)
    (free diane s1130)
    (free diane s1230)
    (free diane s1300)
    (free diane s1330)
    (free diane s1400)
    (free diane s1530)
    (free diane s1600)
    (free diane s1630)

    ;; Kelly's free slots (within 09:00-17:00, excluding 09:30-10:00 and 10:30-11:00)
    (free kelly s0900)
    (free kelly s1000)
    (free kelly s1100)
    (free kelly s1130)
    (free kelly s1200)
    (free kelly s1230)
    (free kelly s1300)
    (free kelly s1330)
    (free kelly s1400)
    (free kelly s1430)
    (free kelly s1500)
    (free kelly s1530)
    (free kelly s1600)
    (free kelly s1630)

    ;; Deborah's free slots (within 09:00-17:00, excluding 09:00-09:30, 10:00-14:00, 14:30-17:00)
    (free deborah s0930)
    (free deborah s1400)

    ;; no meeting scheduled initially
    ;; (scheduled) is intentionally absent
  )

  ;; Goal: schedule the meeting. Per the instruction to prefer the earliest feasible slot,
  ;; the earliest slot that is feasible for all three participants is 14:00.
  ;; The goal thus requests the meeting to be scheduled at s1400.
  (:goal (and (scheduled) (meeting-at s1400)))
)