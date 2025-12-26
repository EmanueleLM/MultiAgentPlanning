(define (problem Meeting-Schedule-8)
    (:domain unified-scheduling)
    (:objects
        Adam Jerry Matthew - agent
        T01 T02 T03 T04 T05 T06 T07 T08 T09 T10 T11 T12 T13 T14 T15 T16 - time-slot
    )
    (:init
        ; Adam's busy times: 10:00 (T03), 12:30 (T08), 13:30 (T10), 14:00 (T11)
        (busy Adam T03)
        (busy Adam T08)
        (busy Adam T10)
        (busy Adam T11)

        ; Jerry's busy times: 9:00 (T01), 12:00 (T07), 15:00 (T13), 15:30 (T14)
        (busy Jerry T01)
        (busy Jerry T07)
        (busy Jerry T13)
        (busy Jerry T14)

        ; Matthew's busy times: 
        ; 9:30-11:00 (T02, T03, T04)
        (busy Matthew T02) (busy Matthew T03) (busy Matthew T04)
        ; 11:30-12:30 (T06, T07)
        (busy Matthew T06) (busy Matthew T07)
        ; 13:00-14:00 (T09, T10)
        (busy Matthew T09) (busy Matthew T10)
        ; 14:30-17:00 (T12, T13, T14, T15, T16)
        (busy Matthew T12) (busy Matthew T13) (busy Matthew T14) (busy Matthew T15) (busy Matthew T16)
    )
    (:goal (exists (?t - time-slot) (scheduled ?t)))
)