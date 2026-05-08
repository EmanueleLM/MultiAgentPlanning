(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Directed travel edges with their semantic labels (asymmetric travel times).
    (edge11 nobhill marina)
    (edge12 marina nobhill)

    ;; Timeline successor relation enforces ordered stages / contiguous intervals used by actions.
    (succ t0900 t1949)
    (succ t1949 t2000)
    (succ t2000 t2200)

    ;; Allowed intervals encode exact durations required by the specification.
    ;; Idle wait interval: 09:00 -> 19:49
    (dur-wait t0900 t1949)
    ;; Move Nob Hill -> Marina (11 minutes): 19:49 -> 20:00
    (dur-move11 t1949 t2000)
    ;; Meeting interval with Mary (120 minutes): 20:00 -> 22:00
    (dur-meet t2000 t2200)

    ;; Mary's availability: Marina District from 20:00 to 22:00.
    (mary-at marina t2000 t2200)

    ;; Initial location and time: Nob Hill at 09:00.
    (at nobhill t0900)
  )

  (:goal (and
    ;; Must complete the required meeting (at least 120 contiguous minutes with Mary).
    (met-mary)
    ;; End the day at Marina District at 22:00 (meeting end).
    (at marina t2200)
  ))