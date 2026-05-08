(define (domain trip-planning)
    (:requirements :typing :negative-preconditions :action-costs)

    (:types city)

    (:predicates
        (at ?c - city)
        (flight ?c1 - city ?c2 - city)
    )

    (:functions
        (current-day) ; Tracks the current day number (starts at 1)
        (total-trip-duration) ; Tracks the total days spent (cost metric)
        (stay-krakow-progress) ; Target >= 6
        (stay-athens-progress) ; Target >= 7
        (stay-zurich-progress) ; Target >= 5
    )

    ; --- Travel Actions (1 day cost, 1 day duration) ---
    
    (:action travel-Z-K
        :parameters ()
        :precondition (and (at zurich) (flight zurich krakow))
        :effect (and (not (at zurich))
                     (at krakow)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )
    (:action travel-K-Z
        :parameters ()
        :precondition (and (at krakow) (flight krakow zurich))
        :effect (and (not (at krakow))
                     (at zurich)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )
    
    (:action travel-Z-A
        :parameters ()
        :precondition (and (at zurich) (flight zurich athens))
        :effect (and (not (at zurich))
                     (at athens)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )
    (:action travel-A-Z
        :parameters ()
        :precondition (and (at athens) (flight athens zurich))
        :effect (and (not (at athens))
                     (at zurich)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )

    ; --- Stay Actions (1 day cost, 1 day duration) ---
    
    (:action stay-krakow
        :parameters ()
        :precondition (and (at krakow)
                           (< (stay-krakow-progress) 6)
        )
        :effect (and (increase (stay-krakow-progress) 1)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )

    (:action stay-zurich
        :parameters ()
        :precondition (and (at zurich)
                           (< (stay-zurich-progress) 5)
        )
        :effect (and (increase (stay-zurich-progress) 1)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )

    ; Athens stay: 7 required days, must occur when current-day <= 7
    (:action stay-athens
        :parameters ()
        :precondition (and (at athens)
                           (< (stay-athens-progress) 7)
                           (<= (current-day) 7) ; Enforces D1-D7 window
        )
        :effect (and (increase (stay-athens-progress) 1)
                     (increase (total-trip-duration) 1)
                     (increase (current-day) 1)
        )
    )
)