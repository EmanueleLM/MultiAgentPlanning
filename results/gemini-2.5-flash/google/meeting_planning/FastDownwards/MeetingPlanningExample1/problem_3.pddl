(define (problem meeting-planning-problem)
    (:domain meeting-planning-domain)

    (:objects
        richmond-district financial-district - location
        betty - friend
    )

    (:init
        (at richmond-district)
        (= (current-time) 540) ; Traveler arrives at Richmond District at 9:00 AM (9 * 60 minutes)
        (= (total-friends-met) 0)
        (= (travel-cost) 0)
    )

    ;; Goal: The primary objective is to meet Betty.
    ;; Since Betty is the only friend mentioned, meeting her maximizes the number of friends met.
    (:goal
        (is-met betty)
    )

    ;; Metric: Minimize the total travel time incurred to achieve the goal.
    ;; This metric ensures an optimal schedule with the least travel cost.
    (:metric minimize (travel-cost))
)