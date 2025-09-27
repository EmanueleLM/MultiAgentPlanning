(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)

  (:objects
    diane helen arthur ethan beverly deborah - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 - time
  )

  (:init
    (unscheduled)
    (= (total-cost) 0)

    (available diane t0900) (available diane t0930) (available diane t1000) (available diane t1030)
    (available diane t1100) (available diane t1130) (available diane t1200) (available diane t1230)
    (available diane t1300) (available diane t1330) (available diane t1400) (available diane t1430)
    (available diane t1500) (available diane t1530)

    (available helen t0900) (available helen t0930) (available helen t1000) (available helen t1030)
    (available helen t1100) (available helen t1130) (available helen t1200) (available helen t1230)
    (available helen t1300) (available helen t1330) (available helen t1400) (available helen t1430)
    (available helen t1500) (available helen t1530)

    (available arthur t0900) (available arthur t0930) (available arthur t1000) (available arthur t1030)
    (available arthur t1100) (available arthur t1130) (available arthur t1200) (available arthur t1230)
    (available arthur t1300) (available arthur t1330) (available arthur t1400) (available arthur t1430)
    (available arthur t1500) (available arthur t1530)

    (available ethan t0930) (available ethan t1030) (available ethan t1230) (available ethan t1300)
    (available ethan t1500) (available ethan t1530)

    (available beverly t1000) (available beverly t1100) (available beverly t1230)
    (available beverly t1300) (available beverly t1530)

    (available deborah t1100) (available deborah t1130) (available deborah t1200)
    (available deborah t1300) (available deborah t1430) (available deborah t1530)
  )

  (:goal (scheduled))
  (:metric minimize (total-cost))
)