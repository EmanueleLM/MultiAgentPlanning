(define (problem calendar_scheduling_example_13)
  (:domain calendar_scheduling)
  (:objects
    gerald roy barbara - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Gerald existing busy schedule
    (is_busy gerald t0900)
    (is_busy gerald t1300)
    (is_busy gerald t1330)
    (is_busy gerald t1500)
    (is_busy gerald t1600)
    (is_busy gerald t1630)
    
    ;; Gerald preferences (Avoid meetings before 13:00 treated as hard constraints)
    (is_busy gerald t0900)
    (is_busy gerald t0930)
    (is_busy gerald t1000)
    (is_busy gerald t1030)
    (is_busy gerald t1100)
    (is_busy gerald t1130)
    (is_busy gerald t1200)
    (is_busy gerald t1230)

    ;; Roy is free the entire day, so no is_busy facts for him

    ;; Barbara existing busy schedule
    (is_busy barbara t0930)
    (is_busy barbara t1130)
    (is_busy barbara t1200)
    (is_busy barbara t1230)
    (is_busy barbara t1300)
    (is_busy barbara t1330)
    (is_busy barbara t1430)
    (is_busy barbara t1530)
    (is_busy barbara t1600)
    (is_busy barbara t1630)
  )
  (:goal (appointment_made))
)