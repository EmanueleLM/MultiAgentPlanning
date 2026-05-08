(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Directed travel edges (asymmetric).
    (edge11 nobhill marina)   ;; Nob Hill -> Marina (11 minutes)
    (edge12 marina nobhill)   ;; Marina -> Nob Hill (12 minutes)

    ;; Ordered, contiguous time stages (successor relation).
    (succ t0900 t1949)
    (succ t1949 t2000)
    (succ t2000 t2200)

    ;; Allowed contiguous intervals matching required durations:
    ;; Wait interval: 09:00 -> 19:49 (idle)
    (dur-wait t0900 t1949)
    ;; Move Nob Hill -> Marina (11 minutes): 19:49 -> 20:00
    (dur-move11 t1949 t2000)
    ;; (If an itinerary needed Marina->NobHill 12-minute move, a corresponding dur-move12 pair would be added.)
    ;; Meeting interval with Mary (120 minutes): 20:00 -> 22:00
    (dur-meet t2000 t2200)

    ;; Mary's availability: Marina District from 20:00 to 22:00.
    (mary-at marina t2000 t2200)

    ;; Initial agent location at start time.
    (at nobhill t0900)
  )

  (:goal (and
    ;; Must complete the required contiguous meeting (at least 120 minutes).
    (met-mary)
    ;; End at Marina District at 22:00 (meeting end).
    (at marina t2200)
  ))