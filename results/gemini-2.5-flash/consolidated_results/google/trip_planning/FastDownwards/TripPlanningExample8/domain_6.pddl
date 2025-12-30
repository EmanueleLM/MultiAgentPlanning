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
        :precondition (and (at zurich) (flight zurich krakow))
        :effect (and (not (at zurich))
                     (at krakow)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    (:action travel-krakow-zurich
        :parameters ()
        :precondition (and (at krakow) (flight krakow zurich))
        :effect (and (not (at krakow))
                     (at zurich)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    
    (:action travel-zurich-athens
        :parameters ()
        :precondition (and (at zurich) (flight zurich athens))
        :effect (and (not (at zurich))
                     (at athens)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )
    (:action travel-athens-zurich
        :parameters ()
        :precondition (and (at athens) (flight athens zurich))
        :effect (and (not (at athens))
                     (at zurich)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    
    (:action stay-krakow
        :parameters ()
        :precondition (and (at krakow)
                           (< (stay-krakow-progress) 6)
        )
        :effect (and (increase stay-krakow-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    (:action stay-zurich
        :parameters ()
        :precondition (and (at zurich)
                           (< (stay-zurich-progress) 5)
        )
        :effect (and (increase stay-zurich-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )

    (:action stay-athens
        :parameters ()
        :precondition (and (at athens)
                           (< (stay-athens-progress) 7)
                           (<= (current-day) 7)
        )
        :effect (and (increase stay-athens-progress 1)
                     (increase total-cost 1)
                     (increase current-day 1)
        )
    )