(define (problem monday-meeting-integrated)
  (:domain meeting-planner-integrated)

  ; No :objects section since Adam/Jerry/Matthew and times are constants in domain.

  (:init
    ; Adam availability
    (free Adam t0900)
    (free Adam t0930)
    (not (free Adam t1000)) ; busy 10:00-10:30
    (free Adam t1030)
    (free Adam t1100)
    (free Adam t1130)
    (not (free Adam t1200)) ; busy 12:00-12:30
    (not (free Adam t1230)) ; busy 12:30-13:00
    (not (free Adam t1330)) ; busy 13:30-14:00
    (not (free Adam t1400)) ; busy 14:00-14:30
    (free Adam t1430)
    (free Adam t1500)
    (free Adam t1530)
    (free Adam t1600)
    (free Adam t1630)

    ; Jerry availability
    (not (free Jerry t0900)) ; busy 09:00-09:30
    (free Jerry t0930)
    (free Jerry t1000)
    (free Jerry t1030)
    (free Jerry t1100)
    (free Jerry t1130)
    (not (free Jerry t1200)) ; busy 12:00-12:30
    (free Jerry t1230)
    (free Jerry t1300)
    (free Jerry t1330)
    (free Jerry t1400)
    (free Jerry t1430)
    (not (free Jerry t1500)) ; busy 15:00-15:30
    (not (free Jerry t1530)) ; busy 15:30-16:00
    (free Jerry t1600)
    (free Jerry t1630)

    ; Matthew availability
    (free Matthew t0900)
    (not (free Matthew t0930))
    (not (free Matthew t1000))
    (not (free Matthew t1030))
    (free Matthew t1100)
    (not (free Matthew t1130))
    (not (free Matthew t1200))
    (free Matthew t1230)
    (not (free Matthew t1300))
    (not (free Matthew t1330))
    (free Matthew t1400)
    (not (free Matthew t1430))
    (not (free Matthew t1500))
    (not (free Matthew t1530))
    (not (free Matthew t1600))
    (not (free Matthew t1630))

  )

  (:goal (scheduled t1100))
)