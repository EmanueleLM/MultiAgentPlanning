(define (problem calendar-scheduling-example24)
    (:domain calendar-scheduling)
    (:objects
        benjamin hannah brenda - person
        slot_09_00 slot_09_30 slot_10_00 slot_10_30
        slot_11_00 slot_11_30 slot_12_00 slot_12_30
        slot_13_00 slot_13_30 slot_14_00 slot_14_30
        slot_15_00 slot_15_30 slot_16_00 slot_16_30 - timeslot
    )
    (:init
        ;; Benjamin's availability (free 9:00-17:00, but prefers not to meet after 9:30)
        ;; This means a meeting must start at 9:00 and end at 9:30.
        (available benjamin slot_09_00)

        ;; Hannah's availability (free 9:00-17:00)
        (available hannah slot_09_00)
        (available hannah slot_09_30)
        (available hannah slot_10_00)
        (available hannah slot_10_30)
        (available hannah slot_11_00)
        (available hannah slot_11_30)
        (available hannah slot_12_00)
        (available hannah slot_12_30)
        (available hannah slot_13_00)
        (available hannah slot_13_30)
        (available hannah slot_14_00)
        (available hannah slot_14_30)
        (available hannah slot_15_00)
        (available hannah slot_15_30)
        (available hannah slot_16_00)
        (available hannah slot_16_30)

        ;; Brenda's availability (busy 9:30-10:00, 11:30-12:30, 14:00-16:30 for 30 min slots)
        ;; Busy 9:30-10:00 -> blocks slot_09_30
        ;; Busy 11:30-12:30 -> blocks slot_11_30, slot_12_00
        ;; Busy 14:00-16:30 -> blocks slot_14_00, slot_14_30, slot_15_00, slot_15_30, slot_16_00
        (available brenda slot_09_00)
        (available brenda slot_10_00)
        (available brenda slot_10_30)
        (available brenda slot_11_00)
        (available brenda slot_12_30)
        (available brenda slot_13_00)
        (available brenda slot_13_30)
        (available brenda slot_16_30)

        ;; No meeting scheduled initially
        (not (meeting_scheduled slot_09_00))
        (not (meeting_scheduled slot_09_30))
        (not (meeting_scheduled slot_10_00))
        (not (meeting_scheduled slot_10_30))
        (not (meeting_scheduled slot_11_00))
        (not (meeting_scheduled slot_11_30))
        (not (meeting_scheduled slot_12_00))
        (not (meeting_scheduled slot_12_30))
        (not (meeting_scheduled slot_13_00))
        (not (meeting_scheduled slot_13_30))
        (not (meeting_scheduled slot_14_00))
        (not (meeting_scheduled slot_14_30))
        (not (meeting_scheduled slot_15_00))
        (not (meeting_scheduled slot_15_30))
        (not (meeting_scheduled slot_16_00))
        (not (meeting_scheduled slot_16_30))
    )
    (:goal (exists (?ts - timeslot) (meeting_scheduled ?ts)))
)