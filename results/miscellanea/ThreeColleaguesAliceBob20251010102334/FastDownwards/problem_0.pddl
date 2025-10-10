(define (problem schedule-meeting-2025-10-21)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ; Participant availabilities (derived from the provided private constraints).
    ; Alice: Available 09:00-11:00 (starts 09:00,09:30,10:00,10:30) and 13:00-16:00 (starts 13:00..15:30)
    (available alice t0900)
    (available alice t0930)
    (available alice t1000)
    (available alice t1030)
    (available alice t1300)
    (available alice t1330)
    (available alice t1400)
    (available alice t1430)
    (available alice t1500)
    (available alice t1530)

    ; Bob: Available 10:30-12:00 (starts 10:30,11:00,11:30) and 14:00-15:30 (starts 14:00,14:30,15:00)
    (available bob t1030)
    (available bob t1100)
    (available bob t1130)
    (available bob t1400)
    (available bob t1430)
    (available bob t1500)

    ; Carol: Available 09:30-10:30 (starts 09:30,10:00), 11:00-12:30 (starts 11:00,11:30,12:00), 15:00-17:00 (starts 15:00..16:30)
    (available carol t0930)
    (available carol t1000)
    (available carol t1100)
    (available carol t1130)
    (available carol t1200)
    (available carol t1500)
    (available carol t1530)
    (available carol t1600)
    (available carol t1630)

    ; Precomputed feasible slots: mark slots where all three participants are available simultaneously.
    ; Intersect availabilities (using only the provided inputs) => only 15:00 is a common start time.
    (feasible t1500)

    ; Note: meeting-scheduled is initially false (not present in :init).
  )

  ;; Goal: find a schedule (planner will set meeting-scheduled and scheduled <slot> via one of the scheduling actions).
  (:goal (meeting-scheduled))
)