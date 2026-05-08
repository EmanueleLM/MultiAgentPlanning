(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Directed travel graph edges (asymmetric travel times encoded by dur-move predicates).
    (edge nobhill marina)
    (edge marina nobhill)

    ;; Timeline successor relation enforces ordered stages/contiguous occupancy.
    (succ t0900 t1949)
    (succ t1949 t2000)
    (succ t2000 t2200)

    ;; Allowed intervals (encode durations exactly as required by the spec).
    ;; Wait interval: 09:00 -> 19:49 (idle)
    (dur-wait t0900 t1949)
    ;; Move interval Nob Hill -> Marina: 19:49 -> 20:00 (11 minutes)
    (dur-move11 t1949 t2000)
    ;; Move interval Marina -> Nob Hill (not used in this chosen schedule, but defined for completeness)
    (dur-move12 t2000 t2012) ; placeholder interval for 12-minute reverse move (object must exist if used)
    ;; Meeting interval: 20:00 -> 22:00 (120 minutes)
    (dur-meet t2000 t2200)

    ;; Mary's availability tied to a specific location and interval (Marina, 20:00-22:00).
    (mary-at marina t2000 t2200)

    ;; Initial location and time: arrive at Nob Hill at 09:00.
    (at nobhill t0900)
  )

  (:goal (and
    ;; Ensure the required meeting is completed (at least 120 contiguous minutes with Mary).
    (met-mary)
    ;; End the day at Marina District at 22:00 (meeting end).
    (at marina t2200)
  ))