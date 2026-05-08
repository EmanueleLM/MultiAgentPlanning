(define (problem Meeting-Schedule-8)
    (:domain unified-scheduling)
    (:objects
        adam jerry matthew - agent
        T01 T02 T03 T04 T05 T06 T07 T08 T09 T10 T11 T12 T13 T14 T15 T16 - time-slot
    )
    (:init
        (= (total-cost) 0)

        ; Adam's busy times: 10:00-10:30 (T03), 12:30-13:00 (T08), 13:30-14:30 (T10, T11)
        (busy adam T03)
        (busy adam T08)
        (busy adam T10)
        (busy adam T11)

        ; Jerry's busy times: 9:00-9:30 (T01), 12:00-12:30 (T07), 15:00-16:00 (T13, T14)
        (busy jerry T01)
        (busy jerry T07)
        (busy jerry T13)
        (busy jerry T14)

        ; Matthew's busy times: 
        ; 9:30-11:00 (T02, T03, T04)
        (busy matthew T02) (busy matthew T03) (busy matthew T04)
        ; 11:30-12:30 (T06, T07)
        (busy matthew T06) (busy matthew T07)
        ; 13:00-14:00 (T09, T10)
        (busy matthew T09) (busy matthew T10)
        ; 14:30-17:00 (T12, T13, T14, T15, T16)
        (busy matthew T12) (busy matthew T13) (busy matthew T14) (busy matthew T15) (busy matthew T16)
    )
    (:goal (meeting-scheduled))