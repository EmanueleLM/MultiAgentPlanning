(define (problem CalendarSchedulingExample16)
  (:domain calendar-scheduling)
  (:objects
    Olivia Anna Virginia Paul - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time
  )
  (:init
    ;; Anna: no meetings -> available at all starts
    (available Anna t0900) (available Anna t0930) (available Anna t1000) (available Anna t1030)
    (available Anna t1100) (available Anna t1130) (available Anna t1200) (available Anna t1230)
    (available Anna t1300) (available Anna t1330) (available Anna t1400) (available Anna t1430)
    (available Anna t1500) (available Anna t1530) (available Anna t1600)

    ;; Olivia unavailable at 12:00,12:30,13:00,14:00,14:30,16:00 -> available elsewhere
    (available Olivia t0900) (available Olivia t0930) (available Olivia t1000) (available Olivia t1030)
    (available Olivia t1100) (available Olivia t1130)
    (available Olivia t1330)
    (available Olivia t1500) (available Olivia t1530)

    ;; Virginia busy 09:00-10:00,11:30-16:00,16:30-17:00 -> available only at 10:00 and 10:30
    (available Virginia t1000) (available Virginia t1030)

    ;; Paul available times computed from his busy slots
    (available Paul t0930) (available Paul t1000) (available Paul t1030)
    (available Paul t1130) (available Paul t1200) (available Paul t1230)
  )
  (:goal (scheduled))
)