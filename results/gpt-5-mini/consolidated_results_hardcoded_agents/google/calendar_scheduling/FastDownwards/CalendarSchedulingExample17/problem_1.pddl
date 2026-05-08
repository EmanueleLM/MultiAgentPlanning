(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  ;; Timeslots are 30-minute aligned between 09:00 and 17:00 (last slot starts at 16:30).
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; --- Individual availability (free slots) derived from provided busy intervals ---
    ;; Margaret's free 30-minute slots (within 09:00-17:00, excluding her busy times)
    (free margaret t1000)
    (free margaret t1100)
    (free margaret t1200)
    (free margaret t1230)
    (free margaret t1330)
    (free margaret t1400)
    (free margaret t1430)
    (free margaret t1530)
    (free margaret t1600)
    (free margaret t1630)

    ;; Donna's free 30-minute slots (busy at 14:30 and 16:00 only)
    (free donna t0900)
    (free donna t0930)
    (free donna t1000)
    (free donna t1030)
    (free donna t1100)
    (free donna t1130)
    (free donna t1200)
    (free donna t1230)
    (free donna t1300)
    (free donna t1330)
    (free donna t1400)
    (free donna t1500)
    (free donna t1530)
    (free donna t1630)

    ;; Helen's free slots respecting her explicit preference to avoid meetings after 13:30
    ;; (Helen's availability filtered to slots that end no later than 13:30)
    (free helen t0930)
    (free helen t1130)
    (free helen t1200)
    (free helen t1230)

    ;; --- Audited feasible intersection (temporal_auditor output) ---
    ;; Only slots that are free for all three participants and respect Helen's preference:
    ;; t1200 (12:00-12:30) and t1230 (12:30-13:00) were audited as feasible.
    (feasible t1200)
    (feasible t1230)
  )

  ;; Goal: produce a plan that schedules the meeting at the selected feasible slot.
  ;; The orchestration selects the earliest audited feasible slot (t1200).
  (:goal (scheduled t1200))
)