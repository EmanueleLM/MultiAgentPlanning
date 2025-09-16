(define (domain coordinated-meeting-planner)
    (:requirements :strips :durative-actions :typing)

    (:types location person)

    (:predicates
        (at ?p - person ?l - location)
        (met-mary ?p - person)
        (meeting-scheduled)
    )

    (:functions
        (time)  ;; Global time function to track current time
        ; Travel time between locations using a function
        (travel-time ?from - location ?to - location)
    )

    (:durative-action traveler-travel
        :parameters (?p - person ?from - location ?to - location)
        :duration (= ?duration (travel-time ?from ?to))
        :condition
            (and
                (at start (at ?p ?from))
                (at start (<= (time) 960))  ;; Traveler can start traveling before 16:00
            )
        :effect
            (and
                (at end (not (at ?p ?from)))
                (at end (at ?p ?to))
                (at end (increase (time) (travel-time ?from ?to)))
            )
    )

    (:durative-action traveler-meet-mary
        :parameters (?p - person)
        :duration (= ?duration 75)
        :condition
            (and
                (at start (at ?p nob_hill))
                (at start (>= (time) 720))  ;; Meeting starts no earlier than 12:00
                (at start (<= (time) 975))  ;; Meeting must conclude by 16:15
                (over all (at mary nob_hill))  ;; Mary is at Nob Hill
            )
        :effect
            (and
                (at end (met-mary ?p))
                (at end (meeting-scheduled))
                (at end (increase (time) 75))
            )
    )

    (:functions
        ((travel-time union_square nob_hill) 9)
        ((travel-time nob_hill union_square) 7)
    )
)