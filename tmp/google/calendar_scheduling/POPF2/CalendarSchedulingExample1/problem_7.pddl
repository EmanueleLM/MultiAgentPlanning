(define (problem schedule-meeting-task)
  (:domain schedule-meeting)

  (:objects
    time9 time10 time11 time12 time1 time2 time3 time4 time5 - time
  )

  (:init
    (possible-time time9) (possible-time time10)
    (possible-time time11) (possible-time time12)
    (possible-time time1) (possible-time time2)
    (possible-time time3) (possible-time time4)
    (possible-time time5)

    (preferred raymond time10)
    (preferred raymond time2)

    (preferred billy time2)
    (preferred billy time3)

    (preferred donald time10)
    (preferred donald time2)
  )

  (:goal
    (exists (?time - time) (common-meeting-time ?time))
  )
)