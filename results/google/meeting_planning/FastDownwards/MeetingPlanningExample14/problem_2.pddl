(define (problem MeetingPlanningExample14)
  (:domain meeting_sf)
  (:objects
    t0900 t0912 t1949 t2000 t2012 t2200 t2212 t2400 - time
  )
  (:init
    (at nobhill)
    (time-is t0900)
    (next t0900 t1949)
    (next t1949 t2000)
    (next t2000 t2200)
    (next t2200 t2400)
    (move11 t1949 t2000)
    (move12 t2000 t2012)
    (move12 t2200 t2212)
    (meeting-span-mary t2000 t2200)
  )
  (:goal
    (and
      (met-mary)
    )
  )
)