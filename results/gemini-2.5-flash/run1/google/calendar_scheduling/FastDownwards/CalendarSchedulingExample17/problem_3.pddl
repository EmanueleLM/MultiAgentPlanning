(define (problem calendar-scheduling-example17)
    (:domain calendar-scheduling)
    (:objects
        ; margaret donna helen - person ; Moved to constants in domain
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330
        t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    )
    (:init
        (= (total-cost) 0)

        ; Initialize current timeslot to the earliest possible start time
        (current_timeslot t0900)

        ; Define sequential order of 30-minute timeslots
        (next_slot t0900 t0930)
        (next_slot t0930 t1000)
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

        ; Margaret's availability (blocked: 9:00-10:00, 10:30-11:00, 11:30-12:00, 13:00-13:30, 15:00-15:30)
        ; This means Margaret is available at the following 30-minute meeting start times:
        (available margaret t1000)
        (available margaret t1100)
        (available margaret t1200)
        (available margaret t1230)
        (available margaret t1330)
        (available margaret t1400)
        (available margaret t1430)
        (available margaret t1530)
        (available margaret t1600)
        (available margaret t1630)

        ; Donna's availability (blocked: 14:30-15:00, 16:00-16:30)
        ; This means Donna is available at the following 30-minute meeting start times:
        (available donna t0900)
        (available donna t0930)
        (available donna t1000)
        (available donna t1030)
        (available donna t1100)
        (available donna t1130)
        (available donna t1200)
        (available donna t1230)
        (available donna t1300)
        (available donna t1330)
        (available donna t1400)
        (available donna t1500)
        (available donna t1530)
        (available donna t1630)

        ; Helen's availability (blocked: 9:00-9:30, 10:00-11:30, 13:00-14:00, 14:30-15:00, 15:30-17:00)
        ; This means Helen is available at the following 30-minute meeting start times:
        (available helen t0930)
        (available helen t1130)
        (available helen t1200)
        (available helen t1230)
        (available helen t1400)
        (available helen t1500)

        ; Helen's preference: "Helen do not want to meet on Monday after 13:30."
        ; This means a meeting must START at or before 13:30.
        (helen_preference_met t0900)
        (helen_preference_met t0930)
        (helen_preference_met t1000)
        (helen_preference_met t1030)
        (helen_preference_met t1100)
        (helen_preference_met t1130)
        (helen_preference_met t1200)
        (helen_preference_met t1230)
        (helen_preference_met t1300)
        (helen_preference_met t1330)
    )
    (:goal (exists (?t - timeslot) (meeting_scheduled ?t)))
    (:metric minimize (total-cost))
)