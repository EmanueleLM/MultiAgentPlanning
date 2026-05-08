(define (problem calendar-scheduling-example5)
    (:domain calendar-scheduling)
    (:objects
        kathryn charlotte lauren - person
        slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130
        slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430
        slot_1500 slot_1530 slot_1600 slot_1630 - time-slot
    )
    (:init
        ;; Initialize all persons as available in all slots.
        (available kathryn slot_0900)
        (available kathryn slot_0930)
        (available kathryn slot_1000)
        (available kathryn slot_1030)
        (available kathryn slot_1100)
        (available kathryn slot_1130)
        (available kathryn slot_1200)
        (available kathryn slot_1230)
        (available kathryn slot_1300)
        (available kathryn slot_1330)
        (available kathryn slot_1400)
        (available kathryn slot_1430)
        (available kathryn slot_1500)
        (available kathryn slot_1530)
        (available kathryn slot_1600)
        (available kathryn slot_1630)

        (available charlotte slot_0900)
        (available charlotte slot_0930)
        (available charlotte slot_1000)
        (available charlotte slot_1030)
        (available charlotte slot_1100)
        (available charlotte slot_1130)
        (available charlotte slot_1200)
        (available charlotte slot_1230)
        (available charlotte slot_1300)
        (available charlotte slot_1330)
        (available charlotte slot_1400)
        (available charlotte slot_1430)
        (available charlotte slot_1500)
        (available charlotte slot_1530)
        (available charlotte slot_1600)
        (available charlotte slot_1630)

        (available lauren slot_0900)
        (available lauren slot_0930)
        (available lauren slot_1000)
        (available lauren slot_1030)
        (available lauren slot_1100)
        (available lauren slot_1130)
        (available lauren slot_1200)
        (available lauren slot_1230)
        (available lauren slot_1300)
        (available lauren slot_1330)
        (available lauren slot_1400)
        (available lauren slot_1430)
        (available lauren slot_1500)
        (available lauren slot_1530)
        (available lauren slot_1600)
        (available lauren slot_1630)

        ;; Kathryn's blocked slots
        (not (available kathryn slot_0900)) ; 09:00-09:30
        (not (available kathryn slot_1030)) ; 10:30-11:00
        (not (available kathryn slot_1130)) ; 11:30-12:00
        (not (available kathryn slot_1330)) ; 13:30-14:00
        (not (available kathryn slot_1400)) ; 14:00-14:30
        (not (available kathryn slot_1630)) ; 16:30-17:00

        ;; Charlotte's blocked slots and preference
        (not (available charlotte slot_1200)) ; 12:00-12:30
        (not (available charlotte slot_1600)) ; 16:00-16:30
        ;; Charlotte's preference: Do not want to meet after 13:30.
        ;; This translates to all slots starting from 13:30 onwards being unavailable for Charlotte.
        (not (available charlotte slot_1330))
        (not (available charlotte slot_1400))
        (not (available charlotte slot_1430))
        (not (available charlotte slot_1500))
        (not (available charlotte slot_1530))
        (not (available charlotte slot_1630))

        ;; Lauren's blocked slots
        (not (available lauren slot_0900)) ; 09:00-09:30
        (not (available lauren slot_0930)) ; 09:30-10:00 (together 09:00-10:00)
        (not (available lauren slot_1200)) ; 12:00-12:30
        (not (available lauren slot_1330)) ; 13:30-14:00
        (not (available lauren slot_1400)) ; 14:00-14:30 (together 13:30-14:30)
        (not (available lauren slot_1500)) ; 15:00-15:30
        (not (available lauren slot_1530)) ; 15:30-16:00 (together 15:00-16:00)
        (not (available lauren slot_1630)) ; 16:30-17:00
    )
    (:goal (exists (?s - time-slot) (meeting-scheduled ?s)))
)