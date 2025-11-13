(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Directed travel graph edges (asymmetric travel times are encoded by dur-move facts below).
    (edge nobhill marina)
    (edge marina nobhill)

    ;; Discrete time intervals chosen to represent the required schedule:
    ;; - Wait interval: 09:00 -> 19:49 (idle)
    ;; - Move interval (Nob Hill -> Marina): 19:49 -> 20:00 (11 minutes)
    ;; - Meeting interval: 20:00 -> 22:00 (120 minutes)
    (dur-wait t0900 t1949)
    (dur-move11 t1949 t2000)
    (dur-meet t2000 t2200)

    ;; Mary's availability must exactly cover the meeting interval (20:00-22:00).
    (mary-available t2000 t2200)

    ;; Initial location and time: arrive at Nob Hill at 09:00.
    (at nobhill t0900)
  )

  (:goal (and
    ;; Ensure the required meeting is completed (at least 120 minutes).
    (met-mary)
    ;; End the day at Marina District at the end of the meeting (22:00).
    (at marina t2200)
  ))