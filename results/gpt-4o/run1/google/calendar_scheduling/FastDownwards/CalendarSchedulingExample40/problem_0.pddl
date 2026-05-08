(define (problem schedule_meeting)
    (:domain meeting_scheduling)
    (:objects
        jacob gabriel matthew - participant
        time_9_00 time_9_30 time_10_00 time_10_30 
        time_11_00 time_11_30 time_12_00 time_12_30 
        time_13_00 time_13_30 time_14_00 time_14_30 
        time_15_00 time_15_30 time_16_00 time_16_30 - timeslot
    )
    (:init
        ; Mark unavailable times due to scheduled meetings
        (scheduled jacob time_10_00)
        (scheduled jacob time_11_30)
        (scheduled jacob time_16_00)
        (scheduled gabriel time_9_30)
        (scheduled gabriel time_13_00)
        (scheduled gabriel time_15_00)
        (scheduled matthew time_9_00)
        (scheduled matthew time_10_30)
        (scheduled matthew time_11_30)
        (scheduled matthew time_12_30)
        (scheduled matthew time_15_30)

        ; Initialize availability (inverse for not having scheduled)
        (available jacob time_9_00) (available jacob time_9_30)
        (available jacob time_10_30) (available jacob time_11_00)
        (available jacob time_12_00) (available jacob time_12_30)
        (available jacob time_13_00) (available jacob time_13_30)
        (available jacob time_14_00) (available jacob time_14_30)
        (available jacob time_15_00) (available jacob time_15_30)
        (available jacob time_16_30)
        
        (available gabriel time_9_00)
        (available gabriel time_10_00) (available gabriel time_10_30)
        (available gabriel time_11_00) (available gabriel time_11_30)
        (available gabriel time_12_00) (available gabriel time_12_30)
        (available gabriel time_13_30) (available gabriel time_14_00)
        (available gabriel time_14_30) (available gabriel time_15_30)
        (available gabriel time_16_00) (available gabriel time_16_30)
        
        (available matthew time_9_30)
        (available matthew time_10_00)
        (available matthew time_11_00)
        (available matthew time_12_00)
        (available matthew time_13_00)
        (available matthew time_13_30)
        (available matthew time_14_00)
        (available matthew time_14_30)
        (available matthew time_15_00)
        (available matthew time_16_00)
        (available matthew time_16_30)

        ; Timeslot adjacencies
        (adjacent time_9_00 time_9_30)
        (adjacent time_9_30 time_10_00)
        (adjacent time_10_00 time_10_30)
        (adjacent time_10_30 time_11_00)
        (adjacent time_11_00 time_11_30)
        (adjacent time_11_30 time_12_00)
        (adjacent time_12_00 time_12_30)
        (adjacent time_12_30 time_13_00)
        (adjacent time_13_00 time_13_30)
        (adjacent time_13_30 time_14_00)
        (adjacent time_14_00 time_14_30)
        (adjacent time_14_30 time_15_00)
        (adjacent time_15_00 time_15_30)
        (adjacent time_15_30 time_16_00)
        (adjacent time_16_00 time_16_30)
    )
    (:goal
        (exists (?t1 ?t2 - timeslot) 
            (and 
                (slot_selected ?t1) 
                (slot_selected ?t2) 
                (adjacent ?t1 ?t2)
            )
        )
    )
)