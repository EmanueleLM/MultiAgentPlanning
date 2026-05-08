(define (problem calendar_scheduling_example_8)
    (:domain calendar_scheduling)
    (:objects
        adam jerry matthew - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Adam's busy schedule (Monday 9:00-17:00)
        (busy adam t1000) ; 10:00-10:30
        (busy adam t1230) ; 12:30-13:00
        (busy adam t1330) ; 13:30-14:00 (part of 13:30-14:30 block)
        (busy adam t1400) ; 14:00-14:30 (part of 13:30-14:30 block)

        ; Jerry's busy schedule (Monday 9:00-17:00)
        (busy jerry t0900) ; 9:00-9:30
        (busy jerry t1200) ; 12:00-12:30
        (busy jerry t1500) ; 15:00-15:30 (part of 15:00-16:00 block)
        (busy jerry t1530) ; 15:30-16:00 (part of 15:00-16:00 block)

        ; Matthew's busy schedule (Monday 9:00-17:00)
        (busy matthew t0930) ; 9:30-10:00 (part of 9:30-11:00 block)
        (busy matthew t1000) ; 10:00-10:30 (part of 9:30-11:00 block)
        (busy matthew t1030) ; 10:30-11:00 (part of 9:30-11:00 block)
        (busy matthew t1130) ; 11:30-12:00 (part of 11:30-12:30 block)
        (busy matthew t1200) ; 12:00-12:30 (part of 11:30-12:30 block)
        (busy matthew t1300) ; 13:00-13:30 (part of 13:00-14:00 block)
        (busy matthew t1330) ; 13:30-14:00 (part of 13:00-14:00 block)
        (busy matthew t1430) ; 14:30-15:00 (part of 14:30-17:00 block)
        (busy matthew t1500) ; 15:00-15:30 (part of 14:30-17:00 block)
        (busy matthew t1530) ; 15:30-16:00 (part of 14:30-17:00 block)
        (busy matthew t1600) ; 16:00-16:30 (part of 14:30-17:00 block)
        (busy matthew t1630) ; 16:30-17:00 (part of 14:30-17:00 block)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)