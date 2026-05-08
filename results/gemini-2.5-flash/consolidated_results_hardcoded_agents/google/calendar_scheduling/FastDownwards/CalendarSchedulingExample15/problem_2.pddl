(define (problem scheduling-example-15)
  (:domain calendar-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_point
    joyce christine alexander - agent
  )
  (:init
    ;; --- Joyce Availability (Free except 11:00-11:30, 13:30-14:00, 14:30-16:30) ---
    (is_available joyce t0900)
    (is_available joyce t0930)
    (is_available joyce t1000)
    (is_available joyce t1030)
    
    (is_available joyce t1130)
    (is_available joyce t1200)
    (is_available joyce t1230)
    (is_available joyce t1300)
    
    (is_available joyce t1400)
    (is_available joyce t1630)
    
    ;; --- Christine Availability (Free, constrained to start >= 12:00) ---
    (is_available christine t1200)
    (is_available christine t1230)
    (is_available christine t1300)
    (is_available christine t1330)
    (is_available christine t1400)
    (is_available christine t1430)
    (is_available christine t1500)
    (is_available christine t1530)
    (is_available christine t1600)
    (is_available christine t1630)
    
    ;; --- Alexander Availability (Free except 9:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00) ---
    (is_available alexander t1100)
    (is_available alexander t1130)
    
    (is_available alexander t1230)
    (is_available alexander t1300)
    
    (is_available alexander t1500)
    (is_available alexander t1600)
  )
  (:goal
    (meeting_scheduled t1230)
  )
)