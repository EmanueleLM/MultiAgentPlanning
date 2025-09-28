(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    elijah janet brian carl timothy - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    ;; Meeting initially not scheduled
    (meeting-not-scheduled)

    ;; Elijah availability (busy: 10:00-11:00 -> t1000,t1030 ; 12:00-12:30 -> t1200 ; 15:00-15:30 -> t1500)
    (available elijah t0900)
    (available elijah t0930)
    (available elijah t1100)
    (available elijah t1130)
    (available elijah t1230)
    (available elijah t1300)
    (available elijah t1330)
    (available elijah t1400)
    (available elijah t1430)
    (available elijah t1530)
    (available elijah t1600)
    (available elijah t1630)

    ;; Janet availability (busy: 09:30-10:30 -> t0930,t1000 ; 13:30-15:30 -> t1330,t1400,t1430,t1500)
    (available janet t0900)
    (available janet t1030)
    (available janet t1100)
    (available janet t1130)
    (available janet t1200)
    (available janet t1230)
    (available janet t1300)
    (available janet t1530)
    (available janet t1600)
    (available janet t1630)

    ;; Brian availability: No meetings on Monday -> no (available brian ...) facts (unavailable all slots)

    ;; Carl availability (busy: 09:30-16:30 -> t0930..t1600)
    (available carl t0900)
    (available carl t1630)

    ;; Timothy availability (busy: 10:30-12:00 -> t1030,t1100,t1130 ;
    ;;                         13:30-14:00 -> t1330 ;
    ;;                         14:30-16:00 -> t1430,t1500,t1530 ;
    ;;                         16:30-17:00 -> t1630)
    (available timothy t0900)
    (available timothy t0930)
    (available timothy t1000)
    (available timothy t1200)
    (available timothy t1230)
    (available timothy t1300)
    (available timothy t1400)
    (available timothy t1600)
  )

  ;; Goal: schedule the single meeting in any one 30-minute slot between 09:00 and 17:00
  (:goal
    (or
      (meeting-at t0900)
      (meeting-at t0930)
      (meeting-at t1000)
      (meeting-at t1030)
      (meeting-at t1100)
      (meeting-at t1130)
      (meeting-at t1200)
      (meeting-at t1230)
      (meeting-at t1300)
      (meeting-at t1330)
      (meeting-at t1400)
      (meeting-at t1430)
      (meeting-at t1500)
      (meeting-at t1530)
      (meeting-at t1600)
      (meeting-at t1630)
    )
  )
)