(define (problem find-meeting-schedule)
    (:domain multi-agent-meeting-scheduling)

    (:objects
        Adam Jerry Matthew - person
        time09:00 time09:30 time10:00 time10:30 time11:00 time11:30
        time12:00 time12:30 time13:00 time13:30 time14:00 time14:30
        time15:00 time15:30 time16:00 time16:30 time17:00 - time)

    (:init
        (available Adam time10:00)
        (available Adam time13:30)
        (available Adam time14:30)

        (available Jerry time10:30)
        (available Jerry time13:30)
        (available Jerry time14:00)

        (available Matthew time14:00)

        (before time09:00 time09:30)
        (before time09:30 time10:00)
        (before time10:00 time10:30)
        (before time10:30 time11:00)
        (before time11:00 time11:30)
        (before time11:30 time12:00)
        (before time12:00 time12:30)
        (before time12:30 time13:00)
        (before time13:00 time13:30)
        (before time13:30 time14:00)
        (before time14:00 time14:30)
        (before time14:30 time15:00)
        (before time15:00 time15:30)
        (before time15:30 time16:00)
        (before time16:00 time16:30)
        (before time16:30 time17:00))

    (:goal
        (exists (?t - time ?t2 - time ?t3 - time)
            (and (before ?t ?t2) (before ?t2 ?t3) (meeting-scheduled-end ?t3))))
)