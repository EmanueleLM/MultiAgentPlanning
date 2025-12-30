(define (problem schedule-meeting-20)
    (:domain scheduling)
    (:objects
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 - time
    )
    
    (:init
        (succeeds T0 T1) (succeeds T1 T2) (succeeds T2 T3) (succeeds T3 T4) 
        (succeeds T4 T5) (succeeds T5 T6) (succeeds T6 T7) (succeeds T7 T8) 
        (succeeds T8 T9) (succeeds T9 T10) (succeeds T10 T11) (succeeds T11 T12) 
        (succeeds T12 T13) (succeeds T13 T14) (succeeds T14 T15)
        
        ; Ralph availability (Busy T9, T11)
        (is_available ralph T0) (is_available ralph T1) (is_available ralph T2) 
        (is_available ralph T3) (is_available ralph T4) (is_available ralph T5) 
        (is_available ralph T6) (is_available ralph T7) (is_available ralph T8) 
        (is_available ralph T10) 
        (is_available ralph T12) (is_available ralph T13) (is_available ralph T14) 
        (is_available ralph T15)
        
        ; Peter availability (Busy T0, T4-T7, T14)
        (is_available peter T1) (is_available peter T2) (is_available peter T3) 
        (is_available peter T8) (is_available peter T9) (is_available peter T10) 
        (is_available peter T11) (is_available peter T12) (is_available peter T13) 
        (is_available peter T15)

        ; Daniel availability (Available T2, T13)
        (is_available daniel T2)
        (is_available daniel T13)

        ; Daniel preference (Preferred T0 through T9 - up to 13:30 start)
        (is_preferred_by_daniel T0) (is_preferred_by_daniel T1) (is_preferred_by_daniel T2) 
        (is_preferred_by_daniel T3) (is_preferred_by_daniel T4) (is_preferred_by_daniel T5) 
        (is_preferred_by_daniel T6) (is_preferred_by_daniel T7) (is_preferred_by_daniel T8) 
        (is_preferred_by_daniel T9)
    )
    
    (:goal (found_schedule))
)