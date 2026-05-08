(define (problem schedule_meeting_17)
    (:domain scheduling)
    (:objects
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 
        T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time-slot
    )
    (:init
        ; Initialize cost metric
        (= (total-cost) 0)

        ; --- Temporal Ordering (9:00 to 17:00 in 30-minute steps) ---
        (next T900 T930) (next T930 T1000) (next T1000 T1030) 
        (next T1030 T1100) (next T1100 T1130) (next T1130 T1200) 
        (next T1200 T1230) (next T1230 T1300) (next T1300 T1330) 
        (next T1330 T1400) (next T1400 T1430) (next T1430 T1500) 
        (next T1500 T1530) (next T1530 T1600) (next T1600 T1630)
        
        ; Start checking at 9:00
        (current-time T900)

        ; --- Margaret Availability ---
        ; Free slots:
        (margaret-free T1000) (margaret-free T1100) (margaret-free T1200) 
        (margaret-free T1230) (margaret-free T1330) (margaret-free T1400) 
        (margaret-free T1430) (margaret-free T1530) (margaret-free T1600) 
        (margaret-free T1630)

        ; --- Donna Availability ---
        ; Free slots:
        (donna-free T900) (donna-free T930) (donna-free T1000) 
        (donna-free T1030) (donna-free T1100) (donna-free T1130) 
        (donna-free T1200) (donna-free T1230) (donna-free T1300) 
        (donna-free T1330) (donna-free T1400) (donna-free T1500) 
        (donna-free T1530) (donna-free T1630)
        
        ; --- Helen Availability ---
        ; Free slots:
        (helen-free T930) (helen-free T1130) (helen-free T1200) 
        (helen-free T1230) (helen-free T1400) (helen-free T1500)
        
        ; --- Helen Preference Constraint (Start <= T1300) ---
        ; Time slots T1330 onwards are blocked by preference constraint
        (helen-preference-ok T900) (helen-preference-ok T930) 
        (helen-preference-ok T1000) (helen-preference-ok T1030) 
        (helen-preference-ok T1100) (helen-preference-ok T1130) 
        (helen-preference-ok T1200) (helen-preference-ok T1230) 
        (helen-preference-ok T1300) 
    )
    
    (:goal (meeting-scheduled))
    (:metric minimize (total-cost))
)