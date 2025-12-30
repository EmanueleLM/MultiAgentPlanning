(define (problem calendarschedulingexample26)
    (:domain scheduling)
    (:objects
        t900 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time_point
        katherine nicole kevin - participant
    )
    
    (:init
        (= (total-cost) 0)
        ; --- 30 Minute Successors ---
        (successor t900 t930) (successor t930 t1000) (successor t1000 t1030) (successor t1030 t1100) 
        (successor t1100 t1130) (successor t1130 t1200) (successor t1200 t1230) (successor t1230 t1300) 
        (successor t1300 t1330) (successor t1330 t1400) (successor t1400 t1430) (successor t1430 t1500) 
        (successor t1500 t1530) (successor t1530 t1600) (successor t1600 t1630) (successor t1630 t1700) 

        ; --- Valid 60 Minute Start Times (Must end by T1700) ---
        (valid_60min_start t900) (valid_60min_start t930) (valid_60min_start t1000) (valid_60min_start t1030) 
        (valid_60min_start t1100) (valid_60min_start t1130) (valid_60min_start t1200) (valid_60min_start t1230) 
        (valid_60min_start t1300) (valid_60min_start t1330) (valid_60min_start t1400) (valid_60min_start t1430) 
        (valid_60min_start t1500) (valid_60min_start t1530) (valid_60min_start t1600)

        ; --- Availability Data ---
        
        ; Katherine (Free 9:00 - 17:00)
        (is_available_30min katherine t900 t930) (is_available_30min katherine t930 t1000) 
        (is_available_30min katherine t1000 t1030) (is_available_30min katherine t1030 t1100) 
        (is_available_30min katherine t1100 t1130) (is_available_30min katherine t1130 t1200) 
        (is_available_30min katherine t1200 t1230) (is_available_30min katherine t1230 t1300) 
        (is_available_30min katherine t1300 t1330) (is_available_30min katherine t1330 t1400) 
        (is_available_30min katherine t1400 t1430) (is_available_30min katherine t1430 t1500) 
        (is_available_30min katherine t1500 t1530) (is_available_30min katherine t1530 t1600) 
        (is_available_30min katherine t1600 t1630) (is_available_30min katherine t1630 t1700) 

        ; Nicole (Free 9:00 - 17:00)
        (is_available_30min nicole t900 t930) (is_available_30min nicole t930 t1000) 
        (is_available_30min nicole t1000 t1030) (is_available_30min nicole t1030 t1100) 
        (is_available_30min nicole t1100 t1130) (is_available_30min nicole t1130 t1200) 
        (is_available_30min nicole t1200 t1230) (is_available_30min nicole t1230 t1300) 
        (is_available_30min nicole t1300 t1330) (is_available_30min nicole t1330 t1400) 
        (is_available_30min nicole t1400 t1430) (is_available_30min nicole t1430 t1500) 
        (is_available_30min nicole t1500 t1530) (is_available_30min nicole t1530 t1600) 
        (is_available_30min nicole t1600 t1630) (is_available_30min nicole t1630 t1700) 
        
        ; Kevin (Available: 10:00-10:30, 11:30-12:00, 15:30-16:30)
        (is_available_30min kevin t1000 t1030) 
        (is_available_30min kevin t1130 t1200) 
        (is_available_30min kevin t1530 t1600) 
        (is_available_30min kevin t1600 t1630) 
    )

    (:goal (schedule_found))
    (:metric minimize (total-cost))