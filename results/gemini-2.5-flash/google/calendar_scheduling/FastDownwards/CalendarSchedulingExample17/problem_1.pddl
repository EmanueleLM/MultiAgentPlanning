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

        ; Initialize all persons as available for all slots (9:00-17:00)
        (person_available margaret t0900) (person_available margaret t0930) (person_available margaret t1000) (person_available margaret t1030) (person_available margaret t1100) (person_available margaret t1130) (person_available margaret t1200) (person_available margaret t1230) (person_available margaret t1300) (person_available margaret t1330) (person_available margaret t1400) (person_available margaret t1430) (person_available margaret t1500) (person_available margaret t1530) (person_available margaret t1600) (person_available margaret t1630)
        (person_available donna t0900) (person_available donna t0930) (person_available donna t1000) (person_available donna t1030) (person_available donna t1100) (person_available donna t1130) (person_available donna t1200) (person_available donna t1230) (person_available donna t1300) (person_available donna t1330) (person_available donna t1400) (person_available donna t1430) (person_available donna t1500) (person_available donna t1530) (person_available donna t1600) (person_available donna t1630)
        (person_available helen t0900) (person_available helen t0930) (person_available helen t1000) (person_available helen t1030) (person_available helen t1100) (person_available helen t1130) (person_available helen t1200) (person_available helen t1230) (person_available helen t1300) (person_available helen t1330) (person_available helen t1400) (person_available helen t1430) (person_available helen t1500) (person_available helen t1530) (person_available helen t1600) (person_available helen t1630)

        ; Margaret's blocked times: 9:00-10:00, 10:30-11:00, 11:30-12:00, 13:00-13:30, 15:00-15:30
        (not (person_available margaret t0900))
        (not (person_available margaret t0930))
        (not (person_available margaret t1030))
        (not (person_available margaret t1130))
        (not (person_available margaret t1300))
        (not (person_available margaret t1500))

        ; Donna's blocked times: 14:30-15:00, 16:00-16:30
        (not (person_available donna t1430))
        (not (person_available donna t1600))

        ; Helen's blocked times: 9:00-9:30, 10:00-11:30, 13:00-14:00, 14:30-15:00, 15:30-17:00
        (not (person_available helen t0900))
        (not (person_available helen t1000))
        (not (person_available helen t1030))
        (not (person_available helen t1100))
        (not (person_available helen t1300))
        (not (person_available helen t1330))
        (not (person_available helen t1430))
        (not (person_available helen t1530))
        (not (person_available helen t1600))
        (not (person_available helen t1630))

        ; Helen's preference (strict constraint): do not meet on Monday after 13:30.
        ; This means the meeting cannot *start* at or after 13:30.
        ; The slots starting at or after 13:30 are: t1330, t1400, t1430, t1500, t1530, t1600, t1630.
        ; Some of these are already blocked by Helen's schedule, we only need to add the new ones.
        ; Slots additionally blocked by preference: t1400, t1500.
        (not (person_available helen t1400))
        (not (person_available helen t1500))

        ; Set initial current consideration slot to the earliest possible meeting start time
        (current_consideration_slot t0900)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled_at ?s)))
)