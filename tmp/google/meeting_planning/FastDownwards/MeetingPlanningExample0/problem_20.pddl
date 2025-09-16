(define (problem coordinated-meeting-scenario)
  (:domain coordinated-meeting)
  (:objects
    you stephanie - person
    marina mission - location
    time0900 time0920 time0930 time0950 time1000 time1020 time1030 time1040 time1100 time1300 time1320 time1340 - time
  )
  (:init
    (at you marina)
    (at stephanie mission)
    (time-instance time0900)(time-instance time0920)(time-instance time0930)(time-instance time0950)
    (time-instance time1000)(time-instance time1020)(time-instance time1030)(time-instance time1040)
    (time-instance time1100)(time-instance time1300)(time-instance time1320)(time-instance time1340)
    (available stephanie time1030)
    (available stephanie time1100)
    (available stephanie time1300)
    (available you time0900)
    (available you time0920)
    (available you time1000)
    (available you time1030)
    (available you time1100)
    (available you time1300)
    (time-greater-equal time1030 time1000)
    (time-greater-equal time1100 time1030)
    (time-greater-equal time1300 time1100)
    (travel-time marina mission time1020 time1040 you)
    (travel-time mission marina time1320 time1340 you)
    (meeting-planned you stephanie time1100 time1300)
  )
  (:goal
    (met-for-minimum-time you stephanie)
  )
)