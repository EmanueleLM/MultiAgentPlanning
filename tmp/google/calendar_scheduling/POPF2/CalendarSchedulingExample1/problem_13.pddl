(define (problem schedule-meeting-task)
  (:domain schedule-meeting)

  (:objects
    time930 time1000 time1030 time1100 time1130 
    time1200 time1230 time1300 time1330 time1400
    time1430 time1500 time1530 time1600 time1630 - time
  )

  (:init
    (possible-time time930) (possible-time time1000) (possible-time time1030) 
    (possible-time time1100) (possible-time time1130) (possible-time time1200)
    (possible-time time1230) (possible-time time1300) (possible-time time1330)
    (possible-time time1400) (possible-time time1430) (possible-time time1500)
    (possible-time time1530) (possible-time time1600) (possible-time time1630)

    (blocked raymond time930)
    (blocked raymond time1130)
    (blocked raymond time1330)
    (blocked raymond time1530)

    (blocked billy time1000)
    (blocked billy time1200)
    (blocked billy time1630)
    (avoid-preference-billy time1530) (avoid-preference-billy time1600) (avoid-preference-billy time1630)

    (blocked donald time930)
    (blocked donald time1000)
    (blocked donald time1200)
    (blocked donald time1400)
    (blocked donald time1600)
  )

  (:goal
    (meeting-scheduled)
  )
)