(define (problem calendar_scheduling_example12)
    (:domain calendar_scheduling)
    (:objects
        david debra kevin - person
        t900 t930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Persons
        (is_person david)
        (is_person debra)
        (is_person kevin)

        ; Temporal sequence of 30-minute slots
        (next_slot t900 t930)
        (next_slot t930 t1000)
        (next_slot t1000 t1030)
        (next_slot t1030 t1100)
        (next_slot t1100 t1130)
        (next_slot t1130 t1200)
        (next_slot t1200 t1230)
        (next_slot t1230 t1300)
        (next_slot t1300 t1330)
        (next_slot t1330 t1400)
        (next_slot t1400 t1430)
        (next_slot t1430 t1500)
        (next_slot t1500 t1530)
        (next_slot t1530 t1600)
        (next_slot t1600 t1630)
        ; t1630 is the last 30-min slot. No 1-hour meeting can start here as it goes past 17:00.

        ; David's schedule: free all day (9:00-17:00)
        (available david t900)
        (available david t930)
        (available david t1000)
        (available david t1030)
        (available david t1100)
        (available david t1130)
        (available david t1200)
        (available david t1230)
        (available david t1300)
        (available david t1330)
        (available david t1400)
        (available david t1430)
        (available david t1500)
        (available david t1530)
        (available david t1600)
        (available david t1630)

        ; Debra's schedule: booked 9:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30
        ; Available slots for Debra
        (available debra t900)
        ;(not (available debra t930)) ; Booked 9:30-10:00
        (available debra t1000)
        (available debra t1030)
        ;(not (available debra t1100)) ; Booked 11:00-11:30
        (available debra t1130)
        ;(not (available debra t1200)) ; Booked 12:00-13:00 (t1200, t1230)
        ;(not (available debra t1230))
        (available debra t1300)
        (available debra t1330)
        ;(not (available debra t1400)) ; Booked 14:00-14:30
        (available debra t1430)
        (available debra t1500)
        (available debra t1530)
        ;(not (available debra t1600)) ; Booked 16:00-16:30
        (available debra t1630)

        ; Kevin's schedule: blocked 9:00-12:00, 14:00-17:00
        ; Available slots for Kevin
        ;(not (available kevin t900)) ; Blocked 9:00-12:00 (t900 to t1130)
        ;(not (available kevin t930))
        ;(not (available kevin t1000))
        ;(not (available kevin t1030))
        ;(not (available kevin t1100))
        ;(not (available kevin t1130))
        (available kevin t1200)
        (available kevin t1230)
        (available kevin t1300)
        (available kevin t1330)
        ;(not (available kevin t1400)) ; Blocked 14:00-17:00 (t1400 to t1630)
        ;(not (available kevin t1430))
        ;(not (available kevin t1500))
        ;(not (available kevin t1530))
        ;(not (available kevin t1600))
        ;(not (available kevin t1630))
    )
    (:goal (exists (?ts - time_slot) (meeting_scheduled ?ts)))
)