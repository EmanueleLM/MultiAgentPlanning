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
    (time-instance time0900) (time-instance time0930) (time-instance time1000) (time-instance time1030)
    (time-instance time1100) (time-instance time1130) (time-instance time1200) (time-instance time1230)
    (time-instance time1300) (time-instance time1330)
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
    (time-greater-equal time0930 time0900)
    (time-greater-equal time1300 time1100)
    (time-greater-equal time1330 time1300)
    (travel-time-you marina mission time0900 time0930)
    (travel-time-stephanie mission marina time0930 time0950)
  )
  (:goal
    (met-for-minimum-time you stephanie)
  )
)