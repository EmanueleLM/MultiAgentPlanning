(define (problem meetingplanningexample0)
  (:domain meeting-planning-sf)
  (:objects
    marina mission - location
    t0900 t1010 t1030 t1230 - time
    stephanie - person
  )
  (:init
    (at marina)
    (time-now t0900)

    ; Directional travel durations encoded as time-advance edges
    (step20 t1010 t1030)   ; Marina -> Mission takes 20 minutes
    ; (step19 edges are supported by the domain but not needed in this minimal verification instance)

    ; Waiting edge to align arrival exactly at 10:30
    (step70 t0900 t1010)

    ; Meeting duration (minimum 120 minutes) within Stephanie's availability window
    (step120 t1030 t1230)
    (steph-available t1030)
    (steph-available t1230)
  )
  (:goal (and
    (met-steph)
  ))
)