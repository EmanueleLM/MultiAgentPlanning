(define (problem ThreeColleaguesAliceBob20251010135800-prob)
  (:domain three-colleagues)
  (:objects
    alice bob carol - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ; all considered 30-minute starting slots (granularity 30 minutes)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)
    ; Alice availability 09:00-11:00 and 13:00-16:00 (start times that fit a 30-min meeting)
    (available alice t0900) (available alice t0930) (available alice t1000) (available alice t1030)
    (available alice t1300) (available alice t1330) (available alice t1400) (available alice t1430)
    (available alice t1500) (available alice t1530)
    ; Bob availability 10:30-12:00 and 14:00-15:30
    (available bob t1030) (available bob t1100) (available bob t1130)
    (available bob t1400) (available bob t1430) (available bob t1500)
    ; Carol availability 09:30-10:30, 11:00-12:30, 15:00-17:00
    (available carol t0930) (available carol t1000)
    (available carol t1100) (available carol t1130) (available carol t1200)
    (available carol t1500) (available carol t1530) (available carol t1600) (available carol t1630)
    ; allow exactly one scheduling action to succeed
    (no-meeting)
  )
  (:goal (meeting-scheduled t1500))
)