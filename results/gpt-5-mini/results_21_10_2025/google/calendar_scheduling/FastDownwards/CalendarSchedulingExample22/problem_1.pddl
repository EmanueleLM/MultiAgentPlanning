(define (problem schedule-mon-60)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    theresa charles betty - person
  )

  (:init
    ; successor relations between half-hour timeslots (09:00..16:30)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; Participant: Theresa
    ; Busy: 09:00-09:30 (t0900), 12:30-13:30 (t1230,t1300), 14:00-15:00 (t1400,t1430), 16:30-17:00 (t1630)
    ; Free half-hour slots:
    (free theresa t0930) (free theresa t1000) (free theresa t1030) (free theresa t1100)
    (free theresa t1130) (free theresa t1200)
    (free theresa t1330)
    (free theresa t1500) (free theresa t1530) (free theresa t1600)

    ; Participant: Charles
    ; Busy: 10:00-10:30 (t1000), 11:30-12:30 (t1130,t1200), 14:00-15:30 (t1400,t1430,t1500)
    ; Free half-hour slots:
    (free charles t0900) (free charles t0930)
    (free charles t1030) (free charles t1100)
    (free charles t1230) (free charles t1300) (free charles t1330)
    (free charles t1530) (free charles t1600) (free charles t1630)

    ; Participant: Betty
    ; Busy: 09:00-10:30 (t0900,t0930,t1000), 12:00-12:30 (t1200), 13:00-14:00 (t1300,t1330), 15:00-16:00 (t1500,t1530)
    ; Free half-hour slots:
    (free betty t1030) (free betty t1100) (free betty t1130)
    (free betty t1230)
    (free betty t1400) (free betty t1430)
    (free betty t1600) (free betty t1630)
  )

  (:goal
    (meeting-scheduled)
  )
)