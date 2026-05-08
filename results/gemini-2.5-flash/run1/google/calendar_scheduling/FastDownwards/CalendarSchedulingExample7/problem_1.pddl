(define (problem calendar_scheduling_example7_problem)
    (:domain calendar_scheduling_example7)
    (:objects
        heather nicholas zachary - person
        t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
        t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time_slot
    )
    (:init
        ;; Heather's availability (30-minute slots not blocked from 9:00-17:00)
        ;; Blocked: 9:00-9:30 (t09_00), 10:30-11:00 (t10_30), 13:00-14:00 (t13_00, t13_30), 14:30-15:00 (t14_30), 16:00-16:30 (t16_00)
        (person_available heather t09_30)
        (person_available heather t10_00)
        (person_available heather t11_00)
        (person_available heather t11_30)
        (person_available heather t12_00)
        (person_available heather t12_30)
        (person_available heather t14_00)
        (person_available heather t15_00)
        (person_available heather t15_30)
        (person_available heather t16_30)

        ;; Nicholas's availability (no meetings the whole day 9:00-17:00)
        (person_available nicholas t09_00)
        (person_available nicholas t09_30)
        (person_available nicholas t10_00)
        (person_available nicholas t10_30)
        (person_available nicholas t11_00)
        (person_available nicholas t11_30)
        (person_available nicholas t12_00)
        (person_available nicholas t12_30)
        (person_available nicholas t13_00)
        (person_available nicholas t13_30)
        (person_available nicholas t14_00)
        (person_available nicholas t14_30)
        (person_available nicholas t15_00)
        (person_available nicholas t15_30)
        (person_available nicholas t16_00)
        (person_available nicholas t16_30)

        ;; Zachary's availability (30-minute slots not blocked from 9:00-17:00)
        ;; Blocked: 9:00-10:30 (t09_00, t09_30, t10_00), 11:00-12:00 (t11_00, t11_30), 12:30-13:00 (t12_30), 13:30-16:30 (t13_30, t14_00, t14_30, t15_00, t15_30, t16_00)
        (person_available zachary t10_30)
        (person_available zachary t12_00)
        (person_available zachary t13_00)
        (person_available zachary t16_30)

        ;; Zachary's preference: would rather not meet on Monday after 14:00.
        ;; This is treated as a hard constraint for PDDL.
        ;; Slots starting at 14:00 or later are undesirable.
        (has_preference_not_after zachary t14_00)
        (has_preference_not_after zachary t14_30)
        (has_preference_not_after zachary t15_00)
        (has_preference_not_after zachary t15_30)
        (has_preference_not_after zachary t16_00)
        (has_preference_not_after zachary t16_30)
    )
    (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)