(define (problem calendar_scheduling_example20)
    (:domain calendar_scheduling_domain)
    (:objects
        ralph peter daniel - person
        slot_0900 slot_0930 slot_1000 slot_1030
        slot_1100 slot_1130 slot_1200 slot_1230
        slot_1300 slot_1330 slot_1400 slot_1430
        slot_1500 slot_1530 slot_1600 slot_1630 - time_slot
    )
    (:init
        ;; Initialize Ralph's availability
        (available ralph slot_0900) (available ralph slot_0930) (available ralph slot_1000) (available ralph slot_1030)
        (available ralph slot_1100) (available ralph slot_1130) (available ralph slot_1200) (available ralph slot_1230)
        (available ralph slot_1300) (available ralph slot_1400) (available ralph slot_1500) (available ralph slot_1530)
        (available ralph slot_1600) (available ralph slot_1630)
        (not (available ralph slot_1330)) ; Ralph busy 13:30-14:00
        (not (available ralph slot_1430)) ; Ralph busy 14:30-15:00

        ;; Initialize Peter's availability
        (available peter slot_0930) (available peter slot_1000) (available peter slot_1030)
        (available peter slot_1300) (available peter slot_1330) (available peter slot_1400) (available peter slot_1430)
        (available peter slot_1500) (available peter slot_1530) (available peter slot_1630)
        (not (available peter slot_0900)) ; Peter busy 9:00-9:30
        (not (available peter slot_1100)) (not (available peter slot_1130)) (not (available peter slot_1200)) (not (available peter slot_1230)) ; Peter busy 11:00-13:00
        (not (available peter slot_1600)) ; Peter busy 16:00-16:30

        ;; Initialize Daniel's availability
        (available daniel slot_1000) (available daniel slot_1530)
        (not (available daniel slot_0900)) (not (available daniel slot_0930)) ; Daniel busy 9:00-10:00
        (not (available daniel slot_1030)) (not (available daniel slot_1100)) (not (available daniel slot_1130)) (not (available daniel slot_1200))
        (not (available daniel slot_1230)) (not (available daniel slot_1300)) (not (available daniel slot_1330)) (not (available daniel slot_1400))
        (not (available daniel slot_1430)) (not (available daniel slot_1500)) ; Daniel busy 10:30-15:30
        (not (available daniel slot_1600)) (not (available daniel slot_1630)) ; Daniel busy 16:00-17:00

        ;; Daniel's preference: avoid meetings after 13:30.
        ;; This is interpreted as slots starting at or after 13:30 are not preferred.
        ;; Thus, only slots _starting_ before 13:30 are considered preferred for Daniel.
        (daniel_prefers_early_slot slot_0900)
        (daniel_prefers_early_slot slot_0930)
        (daniel_prefers_early_slot slot_1000)
        (daniel_prefers_early_slot slot_1030)
        (daniel_prefers_early_slot slot_1100)
        (daniel_prefers_early_slot slot_1130)
        (daniel_prefers_early_slot slot_1200)
        (daniel_prefers_early_slot slot_1230)
        (daniel_prefers_early_slot slot_1300)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))