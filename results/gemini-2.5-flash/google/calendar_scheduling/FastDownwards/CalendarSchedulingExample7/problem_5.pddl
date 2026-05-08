(define (problem calendar-scheduling-example7)
    (:domain calendar-scheduling)
    (:objects
        heather nicholas zachary - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        (= (total_cost) 0)

        ; Heather's availability (30-minute slots between 9:00 and 17:00, respecting blocks)
        ; Blocked: 9:00-9:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30
        (available heather t0930)
        (available heather t1000)
        (available heather t1100)
        (available heather t1130)
        (available heather t1200)
        (available heather t1230)
        (available heather t1400)
        (available heather t1500)
        (available heather t1530)
        (available heather t1630)

        ; Nicholas's availability (no existing meetings between 9:00 and 17:00)
        (available nicholas t0900)
        (available nicholas t0930)
        (available nicholas t1000)
        (available nicholas t1030)
        (available nicholas t1100)
        (available nicholas t1130)
        (available nicholas t1200)
        (available nicholas t1230)
        (available nicholas t1300)
        (available nicholas t1330)
        (available nicholas t1400)
        (available nicholas t1430)
        (available nicholas t1500)
        (available nicholas t1530)
        (available nicholas t1600)
        (available nicholas t1630)

        ; Zachary's availability (30-minute slots between 9:00 and 17:00, respecting blocks)
        ; Blocked: 9:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30
        ; Available: 10:30, 12:00, 13:00, 16:30 (preference for after 14:00 is handled via cost in actions)
        (available zachary t1030)
        (available zachary t1200)
        (available zachary t1300)
        (available zachary t1630)

        ; Predicate to mark time slots that fall "after 14:00" for Zachary's preference
        ; "after 14:00" is interpreted as "starting at or after 14:00"
        (is_after_1400 t1400)
        (is_after_1400 t1430)
        (is_after_1400 t1500)
        (is_after_1400 t1530)
        (is_after_1400 t1600)
        (is_after_1400 t1630)
    )
    (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
    (:metric minimize (total_cost))
)