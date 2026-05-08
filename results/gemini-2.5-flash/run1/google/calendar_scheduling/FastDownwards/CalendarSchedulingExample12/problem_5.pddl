(define (problem calendar_scheduling_example_12_problem)
    (:domain calendar_scheduling_example_12)
    (:objects
        david debra kevin - person
        slot_0900 slot_0930 slot_1000 slot_1030
        slot_1100 slot_1130 slot_1200 slot_1230
        slot_1300 slot_1330 slot_1400 slot_1430
        slot_1500 slot_1530 slot_1600 slot_1630 - time_slot
    )
    (:init
        ;; Define contiguous 30-minute time slots (9:00 to 17:00)
        (next_slot slot_0900 slot_0930)
        (next_slot slot_0930 slot_1000)
        (next_slot slot_1000 slot_1030)
        (next_slot slot_1030 slot_1100)
        (next_slot slot_1100 slot_1130)
        (next_slot slot_1130 slot_1200)
        (next_slot slot_1200 slot_1230)
        (next_slot slot_1230 slot_1300)
        (next_slot slot_1300 slot_1330)
        (next_slot slot_1330 slot_1400)
        (next_slot slot_1400 slot_1430)
        (next_slot slot_1430 slot_1500)
        (next_slot slot_1500 slot_1530)
        (next_slot slot_1530 slot_1600)
        (next_slot slot_1600 slot_1630) ; Last 30-min slot ends at 17:00

        ;; David's schedule: free 9:00 to 17:00
        (is_available david slot_0900) (is_available david slot_0930)
        (is_available david slot_1000) (is_available david slot_1030)
        (is_available david slot_1100) (is_available david slot_1130)
        (is_available david slot_1200) (is_available david slot_1230)
        (is_available david slot_1300) (is_available david slot_1330)
        (is_available david slot_1400) (is_available david slot_1430)
        (is_available david slot_1500) (is_available david slot_1530)
        (is_available david slot_1600) (is_available david slot_1630)

        ;; Debra's schedule
        ;; Booked: 9:30-10:00 (slot_0930), 11:00-11:30 (slot_1100), 12:00-13:00 (slot_1200, slot_1230), 14:00-14:30 (slot_1400), 16:00-16:30 (slot_1600)
        (is_available debra slot_0900)
        ;(is_available debra slot_0930) ; Debra booked - this predicate is correctly omitted
        (is_available debra slot_1000)
        (is_available debra slot_1030)
        ;(is_available debra slot_1100) ; Debra booked - this predicate is correctly omitted
        (is_available debra slot_1130)
        ;(is_available debra slot_1200) ; Debra booked - this predicate is correctly omitted
        ;(is_available debra slot_1230) ; Debra booked - this predicate is correctly omitted
        (is_available debra slot_1300)
        (is_available debra slot_1330)
        ;(is_available debra slot_1400) ; Debra booked - this predicate is correctly omitted
        (is_available debra slot_1430)
        (is_available debra slot_1500)
        (is_available debra slot_1530)
        ;(is_available debra slot_1600) ; Debra booked - this predicate is correctly omitted
        (is_available debra slot_1630)

        ;; Kevin's schedule
        ;; Booked: 9:00-12:00 (slot_0900 to slot_1130), 14:00-17:00 (slot_1400 to slot_1630)
        ;(is_available kevin slot_0900) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_0930) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1000) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1030) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1100) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1130) ; Kevin booked - this predicate is correctly omitted
        (is_available kevin slot_1200)
        (is_available kevin slot_1230)
        (is_available kevin slot_1300)
        (is_available kevin slot_1330)
        ;(is_available kevin slot_1400) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1430) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1500) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1530) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1600) ; Kevin booked - this predicate is correctly omitted
        ;(is_available kevin slot_1630) ; Kevin booked - this predicate is correctly omitted
    )
    (:goal (exists (?s1 - time_slot ?s2 - time_slot)
            (meeting_scheduled ?s1 ?s2)))