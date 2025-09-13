(define (problem schedule-meeting-task)
  (:domain schedule-meeting)

  (:objects
    time930 time1030 time1130 time1230 time1330 time1430 time1530 time1630 - time
  )

  (:init
    (possible-time time930) (possible-time time1030)
    (possible-time time1130) (possible-time time1230)
    (possible-time time1330) (possible-time time1430)
    (possible-time time1530) (possible-time time1630)

    (blocked raymond time930)
    (blocked raymond time1130)
    (blocked raymond time1330)
    (blocked raymond time1530)

    (blocked billy time1030)
    (blocked billy time1230)
    (blocked billy time1630)

    (blocked donald time930)
    (blocked donald time1030)
    (blocked donald time1230)
    (blocked donald time1430)
    (blocked donald time1630)

    (set-preferred-time-billy time1430)
  )

  (:goal
    (exists (?time - time) (common-meeting-time ?time))
  )
)