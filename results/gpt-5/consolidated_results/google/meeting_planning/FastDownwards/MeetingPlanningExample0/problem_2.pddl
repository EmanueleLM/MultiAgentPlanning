(define (problem meetingplanningexample0)
  (:domain meeting-planning-sf)
  (:objects
    t0900 t1010 t1030 t1230 - time
    stephanie - person
  )
  (:init
    (at marina)
    (time-now t0900)
    (step20 t1010 t1030)
    (step70 t0900 t1010)
    (step120 t1030 t1230)
    (steph-available t1030)
    (steph-available t1230)
  )
  (:goal (and
    (met-steph)
  ))
)