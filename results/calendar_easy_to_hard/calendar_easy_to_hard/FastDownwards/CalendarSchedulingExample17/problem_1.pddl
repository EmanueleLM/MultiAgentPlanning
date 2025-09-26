(define (problem schedule-monday-30m)
  (:domain meeting-scheduler)
  (:objects
    peter judith keith evelyn - participant
    ts1 ts2 ts3 ts4 ts5 ts6 ts7 ts8 ts9 ts10 ts11 ts12 ts13 ts14 ts15 ts16 - timeslot
  )
  (:init
    (= (total-cost) 0)

    (busy peter ts1)
    (busy peter ts4)
    (busy peter ts6)
    (busy peter ts8)

    (busy keith ts6)
    (busy keith ts8)
    (busy keith ts9)
    (busy keith ts10)
    (busy keith ts11)
    (busy keith ts12)
    (busy keith ts14)
    (busy keith ts16)

    (busy evelyn ts1)
    (busy evelyn ts2)
    (busy evelyn ts3)
    (busy evelyn ts4)
    (busy evelyn ts5)
    (busy evelyn ts6)
    (busy evelyn ts7)
    (busy evelyn ts10)
    (busy evelyn ts11)
    (busy evelyn ts12)
    (busy evelyn ts13)
    (busy evelyn ts16)

    (allow ts9)
  )
  (:goal (scheduled ts9))
  (:metric minimize (total-cost))
)