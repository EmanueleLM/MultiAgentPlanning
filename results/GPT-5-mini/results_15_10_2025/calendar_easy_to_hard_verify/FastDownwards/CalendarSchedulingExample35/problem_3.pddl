(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)

  (:objects
    m1 - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    (slot-in-workhours t0900) (slot-in-workhours t0930) (slot-in-workhours t1000)
    (slot-in-workhours t1030) (slot-in-workhours t1100) (slot-in-workhours t1130)
    (slot-in-workhours t1200) (slot-in-workhours t1230) (slot-in-workhours t1300)
    (slot-in-workhours t1330) (slot-in-workhours t1400) (slot-in-workhours t1430)
    (slot-in-workhours t1500) (slot-in-workhours t1530) (slot-in-workhours t1600)
    (slot-in-workhours t1630)

    (available diane t0900) (available diane t0930) (available diane t1000) (available diane t1030)
    (available diane t1100) (available diane t1130) (available diane t1200) (available diane t1230)
    (available diane t1300) (available diane t1330) (available diane t1400) (available diane t1430)
    (available diane t1500) (available diane t1530)

    (available helen t0900) (available helen t0930) (available helen t1000) (available helen t1030)
    (available helen t1100) (available helen t1130) (available helen t1200) (available helen t1230)
    (available helen t1300) (available helen t1330) (available helen t1400) (available helen t1430)
    (available helen t1500) (available helen t1530) (available helen t1600) (available helen t1630)

    (available arthur t0900) (available arthur t0930) (available arthur t1000) (available arthur t1030)
    (available arthur t1100) (available arthur t1130) (available arthur t1200) (available arthur t1230)
    (available arthur t1300) (available arthur t1330) (available arthur t1400) (available arthur t1430)
    (available arthur t1500) (available arthur t1530) (available arthur t1600) (available arthur t1630)

    (available ethan t0900) (available ethan t0930) (available ethan t1000) (available ethan t1030)
    (available ethan t1100) (available ethan t1130) (available ethan t1200) (available ethan t1230)
    (available ethan t1300) (available ethan t1330) (available ethan t1400) (available ethan t1430)
    (available ethan t1500) (available ethan t1530) (available ethan t1600) (available ethan t1630)

    (available beverly t0900) (available beverly t0930) (available beverly t1000) (available beverly t1030)
    (available beverly t1100) (available beverly t1130) (available beverly t1200) (available beverly t1230)
    (available beverly t1300) (available beverly t1330) (available beverly t1400) (available beverly t1430)
    (available beverly t1500) (available beverly t1530) (available beverly t1600) (available beverly t1630)

    (available deborah t0900) (available deborah t0930) (available deborah t1000) (available deborah t1030)
    (available deborah t1100) (available deborah t1130) (available deborah t1200) (available deborah t1230)
    (available deborah t1300) (available deborah t1330) (available deborah t1400) (available deborah t1430)
    (available deborah t1500) (available deborah t1530) (available deborah t1600) (available deborah t1630)
  )

  (:goal (and
    (scheduled m1)
    (attending diane m1)
    (attending helen m1)
    (attending arthur m1)
    (attending ethan m1)
    (attending beverly m1)
    (attending deborah m1)
  ))
)