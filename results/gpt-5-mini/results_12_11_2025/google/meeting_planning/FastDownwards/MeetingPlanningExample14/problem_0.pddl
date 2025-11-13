(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Travel graph (directed edges with asymmetric travel times)
    (edge nobhill marina)
    (edge marina nobhill)

    ;; Discrete time intervals chosen to encode the selected schedule (candidate_index 1):
    ;; - Wait interval: 09:00 -> 19:49 (649 minutes)
    ;; - Travel interval (Nob Hill -> Marina): 19:49 -> 20:00 (11 minutes)
    ;; - Meeting interval: 20:00 -> 22:00 (120 minutes)
    (dur-wait t0900 t1949)
    (dur-move11 t1949 t2000)
    ;; Note: dur-move12 is defined in the domain for the reverse edge, but no matching dur-move12 facts
    ;; are provided here because this accepted schedule does not use any 12-minute travel interval.
    (dur-meet t2000 t2200)

    ;; Mary's availability exactly matches the meeting interval (20:00-22:00).
    (mary-available t2000 t2200)

    ;; Initial location and time: arrived at Nob Hill at 09:00.
    (at nobhill t0900)
  )

  (:goal (and
    ;; Meeting must be completed for at least the required 120 minutes.
    (met-mary)
    ;; Final state: at Marina District at the end of the meeting (22:00).
    (at marina t2200)
  ))