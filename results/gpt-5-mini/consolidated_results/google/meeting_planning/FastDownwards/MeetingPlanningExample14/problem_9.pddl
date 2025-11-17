(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    ;; Discrete ordered time stages chosen to model the required contiguous durations:
    ;; t0900 = 09:00 (start), t1949 = 19:49 (depart to arrive exactly at 20:00),
    ;; t2000 = 20:00 (start of Mary's availability), t2200 = 22:00 (end horizon / end of Mary's availability)
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ;; Travel edges as given (asymmetric)
    (edge11 nobhill marina)
    (edge12 marina nobhill)

    ;; Ordered time stages (must be respected by actions)
    (succ t0900 t1949)
    (succ t1949 t2000)
    (succ t2000 t2200)

    ;; Declare which stage-pairs correspond to which allowed intervals/durations.
    ;; These encode the required hard durations for waiting, moving, and meeting.
    (interval-wait t0900 t1949)      ;; waiting/idle from 09:00 until departure at 19:49
    (interval-move11 t1949 t2000)    ;; Nob Hill -> Marina takes 11 minutes (19:49 -> 20:00)
    (interval-meet t2000 t2200)      ;; Meeting interval of 120 minutes (20:00 -> 22:00)
    ;; No other interval pairs are declared: cannot split durations or teleport using unmodeled stages.

    ;; Mary's availability: only at Marina from 20:00 to 22:00 (hard constraint)
    (mary-available marina t2000 t2200)

    ;; Initial location and time
    (at nobhill t0900)
  )

  ;; Goal: meet Mary for the required contiguous meeting interval and finish at Marina at 22:00.
  (:goal (and
    (met-mary)
    (at marina t2200)
  )))