(define (problem calendar-scheduling-instance)
    (:domain calendar-scheduling)
    (:objects
        margaret donna helen - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Define next_slot for ordering
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

        ; Margaret's available times based on schedule (explicitly state available, implicit for unavailable)
        (person_available margaret t1000)
        (person_available margaret t1100)
        (person_available margaret t1200)
        (person_available margaret t1230)
        (person_available margaret t1330)
        (person_available margaret t1400)
        (person_available margaret t1430)
        (person_available margaret t1530)
        (person_available margaret t1600)
        (person_available margaret t1630)

        ; Donna's available times based on schedule
        (person_available donna t0900)
        (person_available donna t0930)
        (person_available donna t1000)
        (person_available donna t1030)
        (person_available donna t1100)
        (person_available donna t1130)
        (person_available donna t1200)
        (person_available donna t1230)
        (person_available donna t1300)
        (person_available donna t1330)
        (person_available donna t1400)
        (person_available donna t1500)
        (person_available donna t1530)
        (person_available donna t1630)

        ; Helen's available times based on schedule AND preference (no meeting after 13:30)
        (person_available helen t0930)
        (person_available helen t1130)
        (person_available helen t1200)
        (person_available helen t1230)

        ; Set initial current consideration slot to the earliest possible meeting start time
        (current_consideration_slot t0900)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled_at ?s)))
)