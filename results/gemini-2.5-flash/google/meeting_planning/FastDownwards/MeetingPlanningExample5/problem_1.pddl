(define (problem meeting-schedule)
    (:domain meeting-planning)
    (:objects
        nob-hill the-castro - location
        william - person
    )
    (:init
        ;; Initial time: 9:00 AM = 540 minutes (9 * 60)
        (= (current-time) 540)
        (at nob-hill) ; Starting location
        (not (has-met william))
        (not (meeting-in-progress william))

        ;; Travel durations in minutes
        (= (travel-duration nob-hill the-castro) 17)
        (= (travel-duration the-castro nob-hill) 16)

        ;; Initialize numeric fluents
        (= (meeting-start-time) 0)
        (= (total-meeting-duration) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (has-met william) ; William must be met
        (>= (total-meeting-duration) 75) ; Minimum 75 minutes meeting duration
    ))
    ;; Metric: Minimize total-cost. Since total-cost is increased by the negative
    ;; of total-meeting-duration, minimizing total-cost effectively maximizes
    ;; total-meeting-duration. Travel time is not penalized here, allowing the
    ;; planner to focus purely on meeting duration.
    (:metric minimize (total-cost))
)