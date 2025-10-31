(define (problem schedule-monday-60min)
  (:domain meeting-scheduling)
  (:objects
    ; participants
    billy maria william - person

    ; 30-minute time slots (start times) from 09:00 to 16:30 inclusive
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ; next relations for consecutive 30-minute slots
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    ; Participant availabilities (free slots) encoded at 30-minute granularity
    ; Billy's availability:
    ; ["09:00-11:30", "12:00-13:00", "15:00-16:00", "16:30-17:00"]
    (free billy t0900) (free billy t0930) (free billy t1000) (free billy t1030) (free billy t1100)
    (free billy t1200) (free billy t1230)
    (free billy t1500) (free billy t1530)
    (free billy t1630)

    ; Maria's availability:
    ; ["09:30-10:00", "10:30-13:00", "13:30-14:00", "14:30-17:00"]
    (free maria t0930)
    (free maria t1030) (free maria t1100) (free maria t1130) (free maria t1200) (free maria t1230)
    (free maria t1330)
    (free maria t1430) (free maria t1500) (free maria t1530) (free maria t1600) (free maria t1630)

    ; William's availability:
    ; ["Monday 09:00-09:30", "Monday 10:00-12:00", "Monday 12:30-13:30", "Monday 15:00-15:30"]
    (free william t0900)
    (free william t1000) (free william t1030) (free william t1100) (free william t1130)
    (free william t1230) (free william t1300)
    (free william t1500)

    ; No meeting scheduled yet -> meeting-started is absent in the initial state
  )

  ;; Goal: schedule exactly one meeting (the planner must apply schedule-meeting once).
  ;; Achieved when (meeting-started) becomes true.
  (:goal (and (meeting-started)))
)