(define (problem MeetingPlanningExample12)
  (:domain meeting_planning)
  (:objects
    north_beach alamo_square - location
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 t1730 t1800 t1830 t1900 t1930 t2000 t2030 t2100 t2130 - time
    c0 c1 c2 c3 - count
  )
  (:init
    (at north_beach)
    (current_time t0900)
    (meeting_count c0)
    
    (can_travel north_beach alamo_square)
    (can_travel alamo_square north_beach)

    ;; Temporal sequence in 30-minute increments
    (next_time t0900 t0930) (next_time t0930 t1000) (next_time t1000 t1030) (next_time t1030 t1100)
    (next_time t1100 t1130) (next_time t1130 t1200) (next_time t1200 t1230) (next_time t1230 t1300)
    (next_time t1300 t1330) (next_time t1330 t1400) (next_time t1400 t1430) (next_time t1430 t1500)
    (next_time t1500 t1530) (next_time t1530 t1600) (next_time t1600 t1630) (next_time t1630 t1700)
    (next_time t1700 t1730) (next_time t1730 t1800) (next_time t1800 t1830) (next_time t1830 t1900)
    (next_time t1900 t1930) (next_time t1930 t2000) (next_time t2000 t2030) (next_time t2030 t2100)
    (next_time t2100 t2130)

    ;; Progress counter for a 90-minute meeting (3 x 30 min)
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3)

    ;; Barbara's availability window: 6:00PM to 9:30PM
    (barbara_at_alamo_square t1800)
    (barbara_at_alamo_square t1830)
    (barbara_at_alamo_square t1900)
    (barbara_at_alamo_square t1930)
    (barbara_at_alamo_square t2000)
    (barbara_at_alamo_square t2030)
    (barbara_at_alamo_square t2100)
  )
  (:goal 
    (meeting_count c3)
  )
)