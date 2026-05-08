(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    (at_slot t0900)
    
    (next_slot t0900 t0930)
    (next_slot t0930 t1000)
    (next_slot t1000 t1030)
    (next_slot t1030 t1100)
    (next_slot t1100 t1130)
    (next_slot t1130 t1200)
    (next_slot t1200 t1230)
    (next_slot t1230 t1300)
    (next_slot t1300 t1330)
    (next_slot t1330 t1400)
    (next_slot t1400 t1430)
    (next_slot t1430 t1500)
    (next_slot t1500 t1530)
    (next_slot t1530 t1600)
    (next_slot t1600 t1630)

    ;; Andrew is wide open
    (available andrew t0900) (available andrew t0930) (available andrew t1000) (available andrew t1030)
    (available andrew t1100) (available andrew t1130) (available andrew t1200) (available andrew t1230)
    (available andrew t1300) (available andrew t1330) (available andrew t1400) (available andrew t1430)
    (available andrew t1500) (available andrew t1530) (available andrew t1600) (available andrew t1630)

    ;; Grace has no meetings
    (available grace t0900) (available grace t0930) (available grace t1000) (available grace t1030)
    (available grace t1100) (available grace t1130) (available grace t1200) (available grace t1230)
    (available grace t1300) (available grace t1330) (available grace t1400) (available grace t1430)
    (available grace t1500) (available grace t1530) (available grace t1600) (available grace t1630)

    ;; Samuel's available slots
    (available samuel t1030) (available samuel t1100)
    (available samuel t1200) (available samuel t1230)
    (available samuel t1330)
    (available samuel t1600)
  )
  (:goal (meeting_scheduled))
)