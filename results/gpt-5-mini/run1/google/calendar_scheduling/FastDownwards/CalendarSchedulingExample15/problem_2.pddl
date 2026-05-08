(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; objects: half-hour start slots from 09:00 to 16:30 (meeting duration = 30 minutes)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; Availability facts (start-inclusive, end-exclusive) computed from participants' schedules
    ;; Joyce free slots (busy 11:00-11:30, 13:30-14:00, 14:30-16:30)
    (available joyce t0900)
    (available joyce t0930)
    (available joyce t1000)
    (available joyce t1030)
    (available joyce t1130)
    (available joyce t1200)
    (available joyce t1230)
    (available joyce t1300)
    (available joyce t1400)
    (available joyce t1630)

    ;; Christine: no meetings but cannot meet before 12:00 -> available from 12:00 onward
    (available christine t1200)
    (available christine t1230)
    (available christine t1300)
    (available christine t1330)
    (available christine t1400)
    (available christine t1430)
    (available christine t1500)
    (available christine t1530)
    (available christine t1600)
    (available christine t1630)

    ;; Alexander free slots (busy 09:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00)
    (available alexander t1100)
    (available alexander t1130)
    (available alexander t1230)
    (available alexander t1300)
    (available alexander t1500)
    (available alexander t1600)
  )

  ;; Goal: produce a finalized meeting (planner must pick a slot where all three can attend).
  (:goal (meeting-finalized))
)