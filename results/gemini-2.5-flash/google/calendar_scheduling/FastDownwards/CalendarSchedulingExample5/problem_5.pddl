(define (problem calendar-scheduling-example5)
    (:domain calendar-scheduling)
    (:objects
        slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130
        slot_1200 slot_1230 slot_1300 slot_1330 slot_1400 slot_1430
        slot_1500 slot_1530 slot_1600 slot_1630 - time-slot
    )
    (:init
        ;; Kathryn's availability (blocked slots: 09:00-09:30, 10:30-11:00, 11:30-12:00, 13:30-14:30, 16:30-17:00)
        (available kathryn slot_0930) ; 09:30-10:00
        (available kathryn slot_1000) ; 10:00-10:30
        (available kathryn slot_1100) ; 11:00-11:30
        (available kathryn slot_1200) ; 12:00-12:30
        (available kathryn slot_1230) ; 12:30-13:00
        (available kathryn slot_1300) ; 13:00-13:30
        (available kathryn slot_1430) ; 14:30-15:00
        (available kathryn slot_1500) ; 15:00-15:30
        (available kathryn slot_1530) ; 15:30-16:00
        (available kathryn slot_1600) ; 16:00-16:30

        ;; Charlotte's availability (blocked slots: 12:00-12:30, 16:00-16:30; preference: no meeting after 13:30)
        ;; Preference means slots from 13:30 onwards are unavailable.
        (available charlotte slot_0900) ; 09:00-09:30
        (available charlotte slot_0930) ; 09:30-10:00
        (available charlotte slot_1000) ; 10:00-10:30
        (available charlotte slot_1030) ; 10:30-11:00
        (available charlotte slot_1100) ; 11:00-11:30
        (available charlotte slot_1130) ; 11:30-12:00
        ;; slot_1200 (blocked)
        (available charlotte slot_1230) ; 12:30-13:00
        (available charlotte slot_1300) ; 13:00-13:30
        ;; All slots from slot_1330 onwards are excluded due to preference.

        ;; Lauren's availability (blocked slots: 09:00-10:00, 12:00-12:30, 13:30-14:30, 15:00-16:00, 16:30-17:00)
        ;; slot_0900, slot_0930 (blocked)
        (available lauren slot_1000) ; 10:00-10:30
        (available lauren slot_1030) ; 10:30-11:00
        (available lauren slot_1100) ; 11:00-11:30
        (available lauren slot_1130) ; 11:30-12:00
        ;; slot_1200 (blocked)
        (available lauren slot_1230) ; 12:30-13:00
        (available lauren slot_1300) ; 13:00-13:30
        ;; slot_1330, slot_1400 (blocked)
        (available lauren slot_1430) ; 14:30-15:00
        ;; slot_1500, slot_1530 (blocked)
        (available lauren slot_1600) ; 16:00-16:30
        ;; slot_1630 (blocked)
    )
    (:goal (meeting-chosen))
)