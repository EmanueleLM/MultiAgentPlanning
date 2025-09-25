(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    kathryn charlotte lauren - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  ;; Initial state encodes each agent's availability for 30-minute start times.
  ;; All busy intervals given by agents were interpreted as unavailable and therefore
  ;; those start times are not listed as available below.
  (:init
    (unscheduled)

    ;; Kathryn unavailable: 09:00, 10:30, 11:30, 13:30, 14:00, 16:30
    ;; Therefore available times for Kathryn:
    (available kathryn t0930)
    (available kathryn t1000)
    (available kathryn t1100)
    (available kathryn t1200)
    (available kathryn t1230)
    (available kathryn t1300)
    (available kathryn t1430)
    (available kathryn t1500)
    (available kathryn t1530)
    (available kathryn t1600)

    ;; Charlotte unavailable: 12:00, 16:00
    ;; Preference (treated as hard): do not meet after 13:30 -> Charlotte only available up to 13:30 start.
    (available charlotte t0900)
    (available charlotte t0930)
    (available charlotte t1000)
    (available charlotte t1030)
    (available charlotte t1100)
    (available charlotte t1130)
    (available charlotte t1230)
    (available charlotte t1300)
    (available charlotte t1330)

    ;; Lauren unavailable: 09:00-10:00, 12:00-12:30, 13:30-14:30, 15:00-16:00, 16:30-17:00
    ;; Therefore available times for Lauren:
    (available lauren t1000)
    (available lauren t1030)
    (available lauren t1100)
    (available lauren t1130)
    (available lauren t1230)
    (available lauren t1300)
    (available lauren t1430)
    (available lauren t1600)
  )

  ;; Goal: schedule a single 30-minute meeting that satisfies all constraints.
  ;; Per instruction to prioritise the earliest feasible meeting slot, the goal
  ;; requests the earliest feasible start time (which is 10:00 given the agents'
  ;; hard constraints). The planner will produce an action that results in
  ;; (meeting-at t1000).
  (:goal (and
    (scheduled)
    (meeting-at t1000)
  ))
)