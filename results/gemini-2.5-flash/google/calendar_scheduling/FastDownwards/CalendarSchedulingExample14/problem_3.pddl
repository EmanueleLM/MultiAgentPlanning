(define (problem calendar_scheduling_example14_problem)
    (:domain calendar_scheduling_example14)
    (:objects
        brandon jerry bradley - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Initialize total-cost for action-costs
        (= (total-cost) 0)

        ; --- Persons ---
        ; brandon jerry bradley are defined as persons

        ; --- Time Slots (30-minute intervals from 9:00 to 17:00) ---
        ; t0900 (9:00-9:30)
        ; t0930 (9:30-10:00)
        ; t1000 (10:00-10:30)
        ; t1030 (10:30-11:00)
        ; t1100 (11:00-11:30)
        ; t1130 (11:30-12:00)
        ; t1200 (12:00-12:30)
        ; t1230 (12:30-13:00)
        ; t1300 (13:00-13:30)
        ; t1330 (13:30-14:00)
        ; t1400 (14:00-14:30)
        ; t1430 (14:30-15:00)
        ; t1500 (15:00-15:30)
        ; t1530 (15:30-16:00)
        ; t1600 (16:00-16:30)
        ; t1630 (16:30-17:00)

        ; --- Jerry's Schedule: No meetings the whole day (Monday 9:00 to 17:00) ---
        (available jerry t0900) (available jerry t0930) (available jerry t1000) (available jerry t1030)
        (available jerry t1100) (available jerry t1130) (available jerry t1200) (available jerry t1230)
        (available jerry t1300) (available jerry t1330) (available jerry t1400) (available jerry t1430)
        (available jerry t1500) (available jerry t1530) (available jerry t1600) (available jerry t1630)

        ; --- Brandon's Schedule: Monday 13:00-14:00, 15:30-16:00, 16:30-17:00 ---
        ; These slots are busy for Brandon: t1300, t1330, t1530, t1630
        ; All other slots are available for Brandon:
        (available brandon t0900) (available brandon t0930) (available brandon t1000) (available brandon t1030)
        (available brandon t1100) (available brandon t1130) (available brandon t1200) (available brandon t1230)
        (available brandon t1400) (available brandon t1430) (available brandon t1500)
        (available brandon t1600)

        ; --- Bradley's Schedule: Monday 9:00-11:30, 12:00-15:00, 16:00-16:30 ---
        ; These slots are busy for Bradley: t0900, t0930, t1000, t1030, t1100, t1200, t1230, t1300, t1330, t1400, t1430, t1600
        ; All other slots are available for Bradley:
        (available bradley t1130)
        (available bradley t1500) (available bradley t1530)
        (available bradley t1630)

        ; --- Brandon's Preference: Avoid meetings before 14:30 ---
        ; Slots starting at 14:30 or later are preferred.
        (is_preferred_slot t1430)
        (is_preferred_slot t1500)
        (is_preferred_slot t1530)
        (is_preferred_slot t1600)
        (is_preferred_slot t1630)
    )
    (:goal (exists (?ts - time_slot)
        (meeting_scheduled ?ts) ; Goal is to schedule any meeting, cost will handle preference
    ))
    (:metric minimize (total-cost)) ; FastDownwards minimizes total-cost by default with action-costs
)