(define (problem schedule-top-choice)
  (:domain meeting-schedule)
  (:objects
    nobhill marina - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    (edge11 nobhill marina)
    (edge12 marina nobhill)

    (succ t0900 t1949)
    (succ t1949 t2000)
    (succ t2000 t2200)

    (interval-wait t0900 t1949)
    (interval-move11 t1949 t2000)
    (interval-meet t2000 t2200)

    (mary-available marina t2000 t2200)

    (at nobhill t0900)
  )

  (:goal (and
    (met-mary)
    (at marina t2200)
  )))