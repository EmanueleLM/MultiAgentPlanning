(define (problem meeting-scheduling-problem)
    (:domain meeting-scheduling)

    (:objects
        thomas dylan jerry - person
        ts09-10 ts10-11 ts11-12 ts12-13 ts13-14 ts14-15 ts15-16 ts16-17 - time-slot
    )

    (:init
        (available thomas ts09-10)
        (available thomas ts10-11)
        (available thomas ts11-12)
        (available thomas ts12-13)
        (available thomas ts13-14)
        (available thomas ts14-15)
        (available thomas ts15-16)
        (available thomas ts16-17)

        (available dylan ts09-10)
        (not-available dylan ts10-11)
        (available dylan ts11-12)
        (available dylan ts12-13)
        (not-available dylan ts13-14)
        (available dylan ts14-15)
        (available dylan ts15-16)
        (available dylan ts16-17)

        (not-available jerry ts09-10)
        (not-available jerry ts10-11)
        (not-available jerry ts11-12)
        (not-available jerry ts12-13)
        (not-available jerry ts13-14)
        (available jerry ts14-15)
        (not-available jerry ts15-16)
        (not-available jerry ts16-17)
    )

    (:goal
        (exists (?t - time-slot) (meeting-scheduled ?t))
    )
)