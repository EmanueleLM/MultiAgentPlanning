(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    ; 30-minute start slots from 09:00 to 16:30 inclusive
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
    heather nicholas zachary - person
  )

  (:init
    ; slot declarations
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ; temporal ordering (next) for sequential earliest-first checking
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030)
    (next t1030 t1100) (next t1100 t1130) (next t1130 t1200)
    (next t1200 t1230) (next t1230 t1300) (next t1300 t1330)
    (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; persons
    (person heather) (person nicholas) (person zachary)

    ; initial ready slot (start checking from earliest work time 09:00)
    (ready t0900)

    ; Busy intervals (interpreted as unavailable 30-min slots whose start >= busy_start and < busy_end)
    ; Heather busy: 09:00-09:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30
    (busy heather t0900)
    (busy heather t1030)
    (busy heather t1300)
    (busy heather t1330)
    (busy heather t1430)
    (busy heather t1600)

    ; Nicholas: preference treated as hard = no meetings on Monday (but user stated "fully available between 09:00 and 17:00")
    ; Interpreting as fully available = no busy slots for Nicholas (no busy facts)

    ; Zachary busy: 09:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30
    (busy zachary t0900) (busy zachary t0930) (busy zachary t1000)
    (busy zachary t1100) (busy zachary t1130)
    (busy zachary t1230)
    (busy zachary t1330) (busy zachary t1400) (busy zachary t1430)
    (busy zachary t1500) (busy zachary t1530) (busy zachary t1600)

    ; Work hours implicitly enforced by only declaring slots within 09:00-16:30 (meeting duration 30m)
    ; All participants must be free at a slot to schedule; preferences treated as hard constraints.

  )

  (:goal (meeting-scheduled))
)