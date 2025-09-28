(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    kayla sandra ryan kathleen walter arthur heather - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - slot
  )

  (:init
    ; kayla free 1-hour starts
    (free kayla t1000)
    (free kayla t1030)
    (free kayla t1100)
    (free kayla t1130)
    (free kayla t1200)
    (free kayla t1230)
    (free kayla t1300)
    (free kayla t1330)
    (free kayla t1600)

    ; sandra free 1-hour starts
    (free sandra t0900)
    (free sandra t0930)
    (free sandra t1000)
    (free sandra t1030)
    (free sandra t1100)
    (free sandra t1230)
    (free sandra t1300)
    (free sandra t1500)
    (free sandra t1530)

    ; ryan free 1-hour starts
    (free ryan t1130)
    (free ryan t1300)
    (free ryan t1330)
    (free ryan t1400)
    (free ryan t1430)
    (free ryan t1500)
    (free ryan t1530)
    (free ryan t1600)

    ; kathleen free all 1-hour starts (full day)
    (free kathleen t0900)
    (free kathleen t0930)
    (free kathleen t1000)
    (free kathleen t1030)
    (free kathleen t1100)
    (free kathleen t1130)
    (free kathleen t1200)
    (free kathleen t1230)
    (free kathleen t1300)
    (free kathleen t1330)
    (free kathleen t1400)
    (free kathleen t1430)
    (free kathleen t1500)
    (free kathleen t1530)
    (free kathleen t1600)

    ; walter free 1-hour starts
    (free walter t1200)
    (free walter t1230)
    (free walter t1300)

    ; arthur free 1-hour starts
    (free arthur t1300)
    (free arthur t1500)
    (free arthur t1530)
    (free arthur t1600)

    ; heather free 1-hour starts
    (free heather t0900)
    (free heather t1300)
    (free heather t1330)
    (free heather t1530)
  )

  ; Goal: have an ack from every participant for the chosen earliest common slot (13:00-14:00 -> t1300).
  (:goal (and
    (acked kayla t1300)
    (acked sandra t1300)
    (acked ryan t1300)
    (acked kathleen t1300)
    (acked walter t1300)
    (acked arthur t1300)
    (acked heather t1300)
  ))
)