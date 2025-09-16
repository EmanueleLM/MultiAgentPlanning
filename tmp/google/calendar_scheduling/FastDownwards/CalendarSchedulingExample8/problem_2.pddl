(define (problem monday-meeting-integrated)
  (:domain calendar-scheduling-integrated)

  (:init
    (free adam t0900)
    (free adam t0930)
    (not (free adam t1000)) ; busy 10:00-10:30
    (free adam t1030)
    (free adam t1100)
    (free adam t1130)
    (not (free adam t1200)) ; busy 12:00-12:30
    (not (free adam t1230)) ; busy 12:30-13:00
    (not (free adam t1330)) ; busy 13:30-14:00
    (not (free adam t1400)) ; busy 14:00-14:30
    (free adam t1430)
    (free adam t1500)
    (free adam t1530)
    (free adam t1600)
    (free adam t1630)

    ; Jerry availability
    (not (free jerry t0900)) ; busy 09:00-09:30
    (free jerry t0930)
    (free jerry t1000)
    (free jerry t1030)
    (free jerry t1100)
    (free jerry t1130)
    (not (free jerry t1200)) ; busy 12:00-12:30
    (free jerry t1230)
    (free jerry t1300)
    (free jerry t1330)
    (free jerry t1400)
    (free jerry t1430)
    (not (free jerry t1500)) ; busy 15:00-15:30
    (not (free jerry t1530)) ; busy 15:30-16:00
    (free jerry t1600)
    (free jerry t1630)

    ; Matthew availability
    (free matthew t0900)
    (not (free matthew t0930))
    (not (free matthew t1000))
    (not (free matthew t1030))
    (free matthew t1100)
    (not (free matthew t1130))
    (not (free matthew t1200))
    (free matthew t1230)
    (not (free matthew t1300))
    (not (free matthew t1330))
    (free matthew t1400)
    (not (free matthew t1430))
    (not (free matthew t1500))
    (not (free matthew t1530))
    (not (free matthew t1600))
    (not (free matthew t1630))

  )

  (:goal (scheduled t1100))
)