(define (domain trip-planning-10)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types city)
    (:constants
        oslo dublin valencia - city
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (connection ?c1 - city ?c2 - city)
        (allocation-complete)
        (started-trip)
    )
    (:functions
        (days-spent)
        (duration-o)
        (duration-d)
        (duration-v)
        (current-cost)
    )

    ;; Allocation Actions: V=5 fixed, O+D=4 (must choose a split).
    ;; Using 'assign' to initialize duration fluents to resolve parser error regarding 'increase' usage on non-cost fluents.

    (:action allocate_durations_O2_D2
        :parameters ()
        :precondition (not (started-trip))
        :effect (and
            (allocation-complete)
            (assign (duration-o) 2)
            (assign (duration-d) 2)
            (assign (duration-v) 5)
        )
    )
    
    (:action allocate_durations_O1_D3
        :parameters ()
        :precondition (not (started-trip))
        :effect (and
            (allocation-complete)
            (assign (duration-o) 1)
            (assign (duration-d) 3)
            (assign (duration-v) 5)
        )
    )
    
    (:action allocate_durations_O3_D1
        :parameters ()
        :precondition (not (started-trip))
        :effect (and
            (allocation-complete)
            (assign (duration-o) 3)
            (assign (duration-d) 1)
            (assign (duration-v) 5)
        )
    )

    ;; Start Trip Action: Must start at Oslo to enforce the necessary O -> D -> V sequence.
    
    (:action start_trip_at_oslo
        :parameters ()
        :precondition (and
            (allocation-complete)
            (> (duration-o) 0)
            (not (started-trip))
        )
        :effect (and
            (started-trip)
            (at oslo)
            (not (allocation-complete))
            (increase (current-cost) 1)
        )
    )

    ;; Visit Actions: Consume duration and add days to the total count.

    (:action visit_oslo
        :parameters ()
        :precondition (and
            (at oslo)
            (> (duration-o) 0)
        )
        :effect (and
            (visited oslo)
            (increase (days-spent) (duration-o))
            (decrease (duration-o) (duration-o))
        )
    )

    (:action visit_dublin
        :parameters ()
        :precondition (and
            (at dublin)
            (> (duration-d) 0)
        )
        :effect (and
            (visited dublin)
            (increase (days-spent) (duration-d))
            (decrease (duration-d) (duration-d))
        )
    )
    
    (:action visit_valencia
        :parameters ()
        :precondition (and
            (at valencia)
            (> (duration-v) 0)
        )
        :effect (and
            (visited valencia)
            (increase (days-spent) (duration-v))
            (decrease (duration-v) (duration-v))
        )
    )

    ;; Travel Actions: Enforce connectivity and sequence O->D->V.

    (:action travel_O_D
        :parameters ()
        :precondition (and 
            (at oslo)
            (visited oslo) 
            (= (duration-o) 0)
            (not (visited dublin))
            (connection oslo dublin)
        )
        :effect (and 
            (not (at oslo)) 
            (at dublin)
            (increase (current-cost) 1)
        )
    )

    (:action travel_D_V
        :parameters ()
        :precondition (and 
            (at dublin)
            (visited dublin) 
            (= (duration-d) 0)
            (not (visited valencia))
            (connection dublin valencia)
        )
        :effect (and 
            (not (at dublin)) 
            (at valencia)
            (increase (current-cost) 1)
        )
    )
)