(define (problem calendar_scheduling_example20)
    (:domain calendar_scheduling_domain)
    (:objects
        slot_0900 slot_0930 slot_1000 slot_1030
        slot_1100 slot_1130 slot_1200 slot_1230
        slot_1300 slot_1330 slot_1400 slot_1430
        slot_1500 slot_1530 slot_1600 slot_1630 - time_slot
    )
    (:init
        ; Ralph is busy 13:30-14:00 and 14:30-15:00. These slots are implicitly unavailable.
        (available ralph slot_0900) (available ralph slot_0930) (available ralph slot_1000) (available ralph slot_1030)
        (available ralph slot_1100) (available ralph slot_1130) (available ralph slot_1200) (available ralph slot_1230)
        (available ralph slot_1300) (available ralph slot_1400) (available ralph slot_1500) (available ralph slot_1530)
        (available ralph slot_1600) (available ralph slot_1630)

        ; Peter is busy 9:00-9:30, 11:00-13:00, 16:00-16:30. These slots are implicitly unavailable.
        (available peter slot_0930) (available peter slot_1000) (available peter slot_1030)
        (available peter slot_1300) (available peter slot_1330) (available peter slot_1400) (available peter slot_1430)
        (available peter slot_1500) (available peter slot_1530) (available peter slot_1630)

        ; Daniel is busy 9:00-10:00, 10:30-15:30, 16:00-17:00. Only 10:00-10:30 and 15:30-16:00 are available.
        (available daniel slot_1000) (available daniel slot_1530)

        ; Daniel prefers to avoid meetings after 13:30.
        ; This implies slots starting at or before 13:30 are preferred.
        (daniel_prefers_early_slot slot_0900)
        (daniel_prefers_early_slot slot_0930)
        (daniel_prefers_early_slot slot_1000)
        (daniel_prefers_early_slot slot_1030)
        (daniel_prefers_early_slot slot_1100)
        (daniel_prefers_early_slot slot_1130)
        (daniel_prefers_early_slot slot_1200)
        (daniel_prefers_early_slot slot_1230)
        (daniel_prefers_early_slot slot_1300)
        (daniel_prefers_early_slot slot_1330) ; Added: 13:30 is "at 13:30", not "after 13:30"
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)