(define (problem coordinated-meeting-scenario)
  (:domain coordinated-meeting)
  (:objects
    you stephanie - person
    marina mission - location
    time0900 time0930 time1000 time1030 time1100 time1130 time1200 time1230 time1300 time1330 - time
  )
  (:init
    (at you marina)
    (at stephanie mission)
    (time time0900) (time time0930) (time time1000) (time time1030)
    (time time1100) (time time1130) (time time1200) (time time1230)
    (time time1300) (time time1330)
    (available stephanie time1030)
    (available stephanie time1100)
    (available stephanie time1130)
    (available stephanie time1200)
    (available stephanie time1230)
    (available stephanie time1300)
    (available you time0900) (available you time0930)
    (available you time1000) (available you time1030)
    (available you time1100) (available you time1130)
    (available you time1200) (available you time1230)
    (available you time1300)
    (time-greater-equal time1330 time1100)
  )
  (:goal
    (met you stephanie)
  )
)