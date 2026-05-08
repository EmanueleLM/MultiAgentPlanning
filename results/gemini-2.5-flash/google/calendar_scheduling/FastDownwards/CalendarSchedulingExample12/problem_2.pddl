(define (problem calendar_scheduling_example12)
    (:domain calendar_scheduling)
    (:objects
        david debra kevin - person
        t900 t930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Temporal sequence of 30-minute slots. A 1-hour meeting consists of two consecutive 30-min slots.
        ; The last possible start for a 1-hour meeting is t1600 (16:00-17:00).
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
        ; Facts for unavailable slots are implicitly false (omitted).
        (available debra t900)             ; 9:00-9:30
        ; (available debra t930) is false  ; Booked 9:30-10:00
        (available debra t1000)            ; 10:00-10:30
        (available debra t1030)            ; 10:30-11:00
        ; (available debra t1100) is false ; Booked 11:00-11:30
        (available debra t1130)            ; 11:30-12:00
        ; (available debra t1200) is false ; Booked 12:00-12:30
        ; (available debra t1230) is false ; Booked 12:30-13:00
        (available debra t1300)            ; 13:00-13:30
        (available debra t1330)            ; 13:30-14:00
        ; (available debra t1400) is false ; Booked 14:00-14:30
        (available debra t1430)            ; 14:30-15:00
        (available debra t1500)            ; 15:00-15:30
        (available debra t1530)            ; 15:30-16:00
        ; (available debra t1600) is false ; Booked 16:00-16:30
        (available debra t1630)            ; 16:30-17:00

        ; Kevin's schedule: blocked 9:00-12:00, 14:00-17:00
        ; Facts for unavailable slots are implicitly false (omitted).
        ; (available kevin t900) is false  ; Blocked 9:00-9:30
        ; (available kevin t930) is false  ; Blocked 9:30-10:00
        ; (available kevin t1000) is false ; Blocked 10:00-10:30
        ; (available kevin t1030) is false ; Blocked 10:30-11:00
        ; (available kevin t1100) is false ; Blocked 11:00-11:30
        ; (available kevin t1130) is false ; Blocked 11:30-12:00
        (available kevin t1200)            ; 12:00-12:30
        (available kevin t1230)            ; 12:30-13:00
        (available kevin t1300)            ; 13:00-13:30
        (available kevin t1330)            ; 13:30-14:00
        ; (available kevin t1400) is false ; Blocked 14:00-14:30
        ; (available kevin t1430) is false ; Blocked 14:30-15:00
        ; (available kevin t1500) is false ; Blocked 15:00-15:30
        ; (available kevin t1530) is false ; Blocked 15:30-16:00
        ; (available kevin t1600) is false ; Blocked 16:00-16:30
        ; (available kevin t1630) is false ; Blocked 16:30-17:00
    )
    (:goal (exists (?ts - time_slot) (meeting_scheduled ?ts)))
)