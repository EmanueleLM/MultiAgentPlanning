(define (domain trip-planning)
    (:requirements :typing :negative-preconditions :action-costs)

    (:types city)

    (:predicates
        (at ?c - city)
        (flight ?c1 - city ?c2 - city)
    )

    (:functions
        (current-day)
        (total-cost)
        (stay-krakow-progress)
        (stay-athens-progress)
        (stay-zurich-progress)
    )
    
    (:action travel-zurich-krakow
        :parameters ()
        :precondition (and (at ZURICH) (flight ZURICH KRAKOW))
        :effect (and (not (at ZURICH))
                     (at KRAKOW)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    (:action travel-krakow-zurich
        :parameters ()
        :precondition (and (at KRAKOW) (flight KRAKOW ZURICH))
        :effect (and (not (at KRAKOW))
                     (at ZURICH)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    
    (:action travel-zurich-athens
        :parameters ()
        :precondition (and (at ZURICH) (flight ZURICH ATHENS))
        :effect (and (not (at ZURICH))
                     (at ATHENS)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    (:action travel-athens-zurich
        :parameters ()
        :precondition (and (at ATHENS) (flight ATHENS ZURICH))
        :effect (and (not (at ATHENS))
                     (at ZURICH)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    
    (:action stay-krakow
        :parameters ()
        :precondition (and (at KRAKOW)
                           (< (stay-krakow-progress) 6)
        )
        :effect (and (increase stay-krakow-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    (:action stay-zurich
        :parameters ()
        :precondition (and (at ZURICH)
                           (< (stay-zurich-progress) 5)
        )
        :effect (and (increase stay-zurich-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    (:action stay-athens
        :parameters ()
        :precondition (and (at ATHENS)
                           (< (stay-athens-progress) 7)
                           ; Temporal constraint: Athens stay must occur between Day 1 and Day 7 (inclusive).
                           (<= (current-day) 7)
        )
        :effect (and (increase stay-athens-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
)