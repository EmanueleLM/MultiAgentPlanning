(define (problem schedule-30min-monday-combined)
  (:domain meeting-scheduling-combined)

  (:objects
    ; 30-minute start slots between 09:00 and 16:30
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    ; participants (agents)
    nicole christine anna terry julie abigail - participant
  )

  (:init
    ; The integration below merges the availability / busy information supplied by the six
    ; participant fragments.  We conservatively treat any asserted busy slot as making a
    ; participant unavailable at that start time; the remaining times are asserted available.
    ; After merging all provided fragments, the start slots that are available for EVERY
    ; participant (intersection) are t1200 and t1600.  These are the only slots asserted
    ; available for all participants below (thus the planner chooses a slot that fits everyone's busy slots).

    ; Available for all participants (intersection of all participants' availability after merging inputs)
    (available nicole t1200)   (available nicole t1600)
    (available christine t1200) (available christine t1600)
    (available anna t1200)     (available anna t1600)
    (available terry t1200)    (available terry t1600)
    (available julie t1200)    (available julie t1600)
    (available abigail t1200)  (available abigail t1600)

    ; Mark timeslots that start before 14:00 (Anna prefers after 14:00; scheduling before 14:00 increases penalty)
    (before14 t0900) (before14 t0930) (before14 t1000) (before14 t1030)
    (before14 t1100) (before14 t1130) (before14 t1200) (before14 t1230)
    (before14 t1300) (before14 t1330)

    ; initialize penalty to zero
    (= (penalty) 0)
  )

  ;; Goal: a single 30-minute meeting is scheduled (meeting-scheduled becomes true).
  ;; The planner will minimize the numeric penalty, so it will prefer scheduling at or after 14:00
  ;; when possible. Given the merged availability above, t1600 is after 14:00 and will be preferred.
  (:goal (meeting-scheduled))

  (:metric minimize (penalty))
)