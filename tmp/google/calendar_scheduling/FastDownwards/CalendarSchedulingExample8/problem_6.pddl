(define (problem find-meeting-schedule)
    (:domain multi-agent-meeting-scheduling)

    (:objects
        time09h00 time09h30 time10h00 time10h30 time11h00 time11h30
        time12h00 time12h30 time13h00 time13h30 time14h00 time14h30
        time15h00 time15h30 time16h00 time16h30 time17h00 - time)

    (:init
        (available Adam time10h00)
        (available Adam time13h30)
        (available Adam time14h30)

        (available Jerry time10h30)
        (available Jerry time13h30)
        (available Jerry time14h00)

        (available Matthew time14h00)

        (before time09h00 time09h30)
        (before time09h30 time10h00)
        (before time10h00 time10h30)
        (before time10h30 time11h00)
        (before time11h00 time11h30)
        (before time11h30 time12h00)
        (before time12h00 time12h30)
        (before time12h30 time13h00)
        (before time13h00 time13h30)
        (before time13h30 time14h00)
        (before time14h00 time14h30)
        (before time14h30 time15h00)
        (before time15h00 time15h30)
        (before time15h30 time16h00)
        (before time16h00 time16h30)
        (before time16h30 time17h00))

    (:goal
        (exists (?t - time ?t2 - time ?t3 - time)
            (and (before ?t ?t2) (before ?t2 ?t3) (meeting-scheduled-end ?t3))))
)