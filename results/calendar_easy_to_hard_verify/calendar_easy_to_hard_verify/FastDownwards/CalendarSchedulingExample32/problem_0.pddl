(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    nicole christine anna terry julie abigail - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; initial total-cost is implicitly 0 (not listed)
    ;; free facts derived from each participant's calendar (busy intervals removed)
    ;; Nicole free slots (busy 10:00 and 14:30 removed)
    (free nicole t0900) (free nicole t0930) (free nicole t1030) (free nicole t1100)
    (free nicole t1130) (free nicole t1200) (free nicole t1230) (free nicole t1300)
    (free nicole t1330) (free nicole t1400) (free nicole t1500) (free nicole t1530)
    (free nicole t1600) (free nicole t1630)

    ;; Christine free (busy 11:00 and 12:30 removed)
    (free christine t0900) (free christine t0930) (free christine t1000) (free christine t1030)
    (free christine t1130) (free christine t1200) (free christine t1300) (free christine t1330)
    (free christine t1400) (free christine t1430) (free christine t1500) (free christine t1530)
    (free christine t1600) (free christine t1630)

    ;; Anna free (busy slots removed; preference enforced as hard constraint: only slots at or after 14:00)
    (free anna t1400) (free anna t1430) (free anna t1500) (free anna t1600)

    ;; Terry free (busy 09:30-11:30, 13:00-13:30, 14:00-15:30 removed)
    (free terry t0900) (free terry t1130) (free terry t1200) (free terry t1230)
    (free terry t1330) (free terry t1530) (free terry t1600) (free terry t1630)

    ;; Julie free (busy 10:00-12:00, 12:30-13:30, 14:00-15:00 removed)
    (free julie t0900) (free julie t0930) (free julie t1200) (free julie t1330)
    (free julie t1500) (free julie t1530) (free julie t1600) (free julie t1630)

    ;; Abigail free (busy 09:00-10:00, 11:30-12:00, 12:30-14:00, 14:30-15:00, 16:30-17:00 removed)
    (free abigail t1000) (free abigail t1030) (free abigail t1100) (free abigail t1200)
    (free abigail t1400) (free abigail t1500) (free abigail t1530) (free abigail t1600)
  )

  ;; Goal: schedule exactly one meeting that satisfies all hard constraints.
  ;; Minimize total-cost so planner prefers the earliest feasible slot.
  (:goal (meeting-scheduled))

  (:metric minimize (total-cost))
)