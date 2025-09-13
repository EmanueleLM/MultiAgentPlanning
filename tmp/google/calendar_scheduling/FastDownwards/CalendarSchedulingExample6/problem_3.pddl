(define (problem meeting-scheduling-problem)
    (:domain meeting-scheduling)
    
    (:objects
        Thomas Dylan Jerry - person
        ts09-10 ts10-11 ts11-12 ts12-13 ts13-14 ts14-15 ts15-16 ts16-17 - time-slot
    )

    (:init
        ;; Thomas's availability
        (available Thomas ts09-10)
        (available Thomas ts10-11)
        (available Thomas ts11-12)
        (available Thomas ts12-13)
        (available Thomas ts13-14)
        (available Thomas ts14-15)
        (available Thomas ts15-16)
        (available Thomas ts16-17)

        ;; Dylan's availability
        (available Dylan ts09-10)
        (available Dylan ts11-12)
        (available Dylan ts12-13)
        (available Dylan ts14-15)
        (available Dylan ts15-16)
        (available Dylan ts16-17)

        ;; Jerry's availability
        (available Jerry ts11-12)
        (available Jerry ts14-15)
    )

    (:goal
        (exists (?t - time-slot)
            (meeting-scheduled ?t)
        )
    )
)