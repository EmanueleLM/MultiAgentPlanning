(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    ; time slots (30-minute resolution)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot

    ; participants
    michelle steven jerry - participant

    ; meeting
    m1 - meeting
  )

  (:init
    ; declare slots
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ; next relations (30-minute steps)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; participants and meeting
    (participant michelle) (participant steven) (participant jerry)
    (meeting m1)

    ; Free slots for Michelle (busy 11:00-12:00 -> t1100 and t1130 unavailable)
    (free michelle t0900) (free michelle t0930) (free michelle t1000) (free michelle t1030)
    (free michelle t1200) (free michelle t1230) (free michelle t1300) (free michelle t1330)
    (free michelle t1400) (free michelle t1430) (free michelle t1500) (free michelle t1530)
    (free michelle t1600) (free michelle t1630)

    ; Free slots for Steven (busy 09:00-09:30 -> t0900, 11:30-12:00 -> t1130,
    ; 13:30-14:00 -> t1330, 15:30-16:00 -> t1530)
    (free steven t0930) (free steven t1000) (free steven t1030) (free steven t1100)
    (free steven t1200) (free steven t1230) (free steven t1300)
    (free steven t1400) (free steven t1430) (free steven t1500)
    (free steven t1600) (free steven t1630)

    ; Free slots for Jerry (busy: 09:00-09:30 t0900, 10:00-11:00 t1000,t1030,
    ; 11:30-12:30 t1130,t1200, 13:00-14:30 t1300,t1330,t1400, 15:30-16:00 t1530, 16:30-17:00 t1630)
    (free jerry t0930) (free jerry t1100) (free jerry t1230)
    (free jerry t1430) (free jerry t1500) (free jerry t1600)
  )

  ; Goal: earliest feasible 60-minute start that fits all participants. Chosen start: 14:30
  (:goal (and
    (meeting-at m1 t1430)
  ))
)