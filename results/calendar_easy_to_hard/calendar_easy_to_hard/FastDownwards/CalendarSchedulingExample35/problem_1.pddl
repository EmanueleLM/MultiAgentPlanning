(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    diane helen arthur ethan beverly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 - timeslot
  )

  (:init
    (= (total-cost) 0)

    (valid-slot t0900) (valid-slot t0930) (valid-slot t1000) (valid-slot t1030)
    (valid-slot t1100) (valid-slot t1130) (valid-slot t1200) (valid-slot t1230)
    (valid-slot t1300) (valid-slot t1330) (valid-slot t1400) (valid-slot t1430)
    (valid-slot t1500)

    (free diane t0900) (free diane t0930) (free diane t1000) (free diane t1030)
    (free diane t1100) (free diane t1130) (free diane t1200) (free diane t1230)
    (free diane t1300) (free diane t1330) (free diane t1400) (free diane t1430)
    (free diane t1500)

    (free helen t0900) (free helen t0930) (free helen t1000) (free helen t1030)
    (free helen t1100) (free helen t1130) (free helen t1200) (free helen t1230)
    (free helen t1300) (free helen t1330) (free helen t1400) (free helen t1430)
    (free helen t1500)

    (free arthur t0900) (free arthur t0930) (free arthur t1000) (free arthur t1030)
    (free arthur t1100) (free arthur t1130) (free arthur t1200) (free arthur t1230)
    (free arthur t1300) (free arthur t1330) (free arthur t1400) (free arthur t1430)
    (free arthur t1500)

    (free ethan t0930) (free ethan t1030) (free ethan t1230) (free ethan t1300) (free ethan t1500)

    (free beverly t1000) (free beverly t1100) (free beverly t1230) (free beverly t1300)

    (free deborah t1100) (free deborah t1130) (free deborah t1200) (free deborah t1300) (free deborah t1430)
  )

  (:goal (meeting-scheduled))

  (:metric minimize (total-cost))
)