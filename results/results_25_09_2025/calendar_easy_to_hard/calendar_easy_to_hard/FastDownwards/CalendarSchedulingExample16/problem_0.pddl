(define (problem schedule-meeting-all)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ; slots covering Monday 09:00-17:00 in 30-minute granularity
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ; scott's private busy times (from input)
    ; Busy Monday 09:30-10:30 -> t0930, t1000
    (scott-busy t0930) (scott-busy t1000)
    ; Busy Monday 13:30-14:00 -> t1330
    (scott-busy t1330)
    ; Busy Monday 14:30-15:00 -> t1430
    (scott-busy t1430)
    ; Busy Monday 15:30-16:00 -> t1530
    (scott-busy t1530)
    ; Busy Monday 16:30-17:00 -> t1630
    (scott-busy t1630)

    ; gabriel's private info: "No meetings on Monday" -> no busy facts declared for gabriel
    ; (no gabriel-busy facts)

    ; christine's private busy times (from input)
    ; Busy Monday 09:00-10:00 -> t0900, t0930
    (christine-busy t0900) (christine-busy t0930)
    ; Busy Monday 10:30-12:30 -> t1030, t1100, t1130, t1200
    (christine-busy t1030) (christine-busy t1100) (christine-busy t1130) (christine-busy t1200)
    ; Busy Monday 13:00-17:00 -> t1300, t1330, t1400, t1430, t1500, t1530, t1600, t1630
    (christine-busy t1300) (christine-busy t1330) (christine-busy t1400)
    (christine-busy t1430) (christine-busy t1500) (christine-busy t1530)
    (christine-busy t1600) (christine-busy t1630)
  )

  ; Goal: schedule a 30-minute meeting (one 30-min slot) that fits all participants.
  ; Based on the agents' stated constraints, t1230 (12:30-13:00) is the shared free slot.
  (:goal (meeting-scheduled t1230))
)