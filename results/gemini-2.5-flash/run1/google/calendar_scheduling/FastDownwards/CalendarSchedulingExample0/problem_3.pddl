(define (problem calendar_scheduling_example0_problem)
    (:domain calendar_scheduling_example0)
    (:objects
        michelle steven jerry - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Define consecutive 30-minute time slots (from 09:00 to 17:00)
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
        (next_slot t1600 t1630) ; t1600 is the last possible start for a 1-hour meeting (16:00-17:00)

        ; Michelle's blocked times: Monday 11:00 to 12:00
        (blocked michelle t1100) ; 11:00-11:30
        (blocked michelle t1130) ; 11:30-12:00

        ; Steven's blocked times:
        ; Monday 9:00 to 9:30
        (blocked steven t0900) ; 09:00-09:30
        ; Monday 11:30 to 12:00
        (blocked steven t1130) ; 11:30-12:00
        ; Monday 13:30 to 14:00
        (blocked steven t1330) ; 13:30-14:00
        ; Monday 15:30 to 16:00
        (blocked steven t1530) ; 15:30-16:00

        ; Jerry's blocked times:
        ; Monday 9:00 to 9:30
        (blocked jerry t0900) ; 09:00-09:30
        ; Monday 10:00 to 11:00
        (blocked jerry t1000) ; 10:00-10:30
        (blocked jerry t1030) ; 10:30-11:00
        ; Monday 11:30 to 12:30
        (blocked jerry t1130) ; 11:30-12:00
        (blocked jerry t1200) ; 12:00-12:30
        ; Monday 13:00 to 14:30
        (blocked jerry t1300) ; 13:00-13:30
        (blocked jerry t1330) ; 13:30-14:00
        (blocked jerry t1400) ; 14:00-14:30
        ; Monday 15:30 to 16:00
        (blocked jerry t1530) ; 15:30-16:00
        ; Monday 16:30 to 17:00
        (blocked jerry t1630) ; 16:30-17:00
    )
    (:goal (meeting_scheduled))