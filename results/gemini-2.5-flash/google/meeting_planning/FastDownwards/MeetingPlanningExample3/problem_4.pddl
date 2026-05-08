(define (problem meeting-planning-problem)
    (:domain meeting-planning)
    (:objects
        bayview golden-gate-park - location
        t-9-00am t-9-22am t-10-00am t-10-52am t-11-30am - time-point
    )
    (:init
        (at bayview)
        (current-time t-9-00am)
        (not (met-barbara))
        (not (has-travelled-b-ggp))
        (= (total-cost) 0)

        ; Pre-computed availability constraints for Barbara
        ; Barbara is available from 8:00 AM to 11:30 AM.
        ; Traveler arrives at Golden Gate Park earliest at 9:22 AM.
        ; Both t-9-22am (562 min) and t-10-00am (600 min) are within Barbara's availability window (480-690 min).
        (is-available-for-meeting t-9-22am)
        (is-available-for-meeting t-10-00am)

        ; Pre-computed meeting end constraints for a 90-minute meeting
        ; If meeting starts at 9:22 AM (562 min), it ends at 10:52 AM (652 min).
        ; 652 min <= 690 min (Barbara's end time) - Valid.
        (meeting-ends-by-barbara-limit t-9-22am t-10-52am)

        ; If meeting starts at 10:00 AM (600 min), it ends at 11:30 AM (690 min).
        ; 690 min <= 690 min (Barbara's end time) - Valid.
        (meeting-ends-by-barbara-limit t-10-00am t-11-30am)
    )
    (:goal
        (and
            (met-barbara)
        )
    )
    (:metric minimize (total-cost))
)