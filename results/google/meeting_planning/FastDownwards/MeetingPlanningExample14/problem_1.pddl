(define (problem MeetingPlanningExample14)
  (:domain meeting_sf)

  (:objects
    nobhill marinadistrict - location
    t0900 t0912 t1949 t2000 t2012 t2200 t2212 t2400 - time
  )

  (:init
    ; start state
    (at nobhill)
    (time-is t0900)

    ; permissible passive time advancement within the planning horizon
    (next t0900 t1949)
    (next t1949 t2000)
    (next t2000 t2200)
    (next t2200 t2400)

    ; asymmetric travel primitives (deterministic durations)
    (move11 t1949 t2000)   ; Nob Hill -> Marina District: 19:49 -> 20:00 (11 min)
    (move12 t2000 t2012)   ; Marina District -> Nob Hill: 20:00 -> 20:12 (12 min)
    (move12 t2200 t2212)   ; Marina District -> Nob Hill: 22:00 -> 22:12 (12 min)

    ; Mary’s availability with enforced continuous minimum duration
    (meeting-span-mary t2000 t2200) ; 20:00 -> 22:00 (120 minutes)
  )

  (:goal
    (and
      (met-mary)
    )
  )
)