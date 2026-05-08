(define (domain trip-planning-10)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)
    (:constants
        oslo dublin valencia - city
    )
    (:predicates
        (connection ?c1 - city ?c2 - city)
        (at ?c - city)
        (visited ?c - city)
        
        ;; Allocation predicates: V is always 5. O+D = 4 days.
        (A-O1-D3) (A-O2-D2) (A-O3-D1)
        (Allocation-Chosen)
        
        ;; Day tracking: (DN) means N days have been completed. Target is D9.
        (D0) (D1) (D2) (D3) (D4) (D5) (D6) (D7) (D8) (D9)
    )
    (:functions
        (total-cost)
    )

    ;; 1. Allocation Actions (Must choose one split for the 4 available days)
    
    (:action allocate_O1_D3
        :parameters ()
        :precondition (and (D0) (not (Allocation-Chosen)))
        :effect (and (A-O1-D3) (Allocation-Chosen))
    )
    
    (:action allocate_O2_D2
        :parameters ()
        :precondition (and (D0) (not (Allocation-Chosen)))
        :effect (and (A-O2-D2) (Allocation-Chosen))
    )
    
    (:action allocate_O3_D1
        :parameters ()
        :precondition (and (D0) (not (Allocation-Chosen)))
        :effect (and (A-O3-D1) (Allocation-Chosen))
    )

    ;; 2. Trip Sequence: O -> D -> V (Must start at Oslo)

    ;; 2a. Visit Oslo (Transitions D0 -> D_O). Cost reflects initiating the stay/trip.
    
    ;; Case O=1 (A-O1-D3). D0 -> D1.
    (:action visit_oslo_1d
        :parameters ()
        :precondition (and (A-O1-D3) (D0) (not (visited oslo)) (Allocation-Chosen))
        :effect (and
            (at oslo)
            (visited oslo)
            (not (D0)) (D1)
            (increase (total-cost) 1)
        )
    )

    ;; Case O=2 (A-O2-D2). D0 -> D2.
    (:action visit_oslo_2d
        :parameters ()
        :precondition (and (A-O2-D2) (D0) (not (visited oslo)) (Allocation-Chosen))
        :effect (and
            (at oslo)
            (visited oslo)
            (not (D0)) (D2)
            (increase (total-cost) 1)
        )
    )
    
    ;; Case O=3 (A-O3-D1). D0 -> D3.
    (:action visit_oslo_3d
        :parameters ()
        :precondition (and (A-O3-D1) (D0) (not (visited oslo)) (Allocation-Chosen))
        :effect (and
            (at oslo)
            (visited oslo)
            (not (D0)) (D3)
            (increase (total-cost) 1)
        )
    )
    
    ;; 2b. Travel Oslo -> Dublin (Requires O duration spent)

    (:action travel_O_D
        :parameters ()
        :precondition (and
            (at oslo)
            (visited oslo)
            (connection oslo dublin)
            (not (visited dublin)) 
        )
        :effect (and
            (not (at oslo))
            (at dublin)
            (increase (total-cost) 1)
        )
    )
    
    ;; 2c. Visit Dublin (Transitions D_O -> D4)
    
    ;; Case D=3 (A-O1-D3). Current state D1.
    (:action visit_dublin_3d
        :parameters ()
        :precondition (and
            (A-O1-D3) (at dublin) 
            (D1)
            (not (visited dublin))
        )
        :effect (and
            (visited dublin)
            (not (D1)) (D4)
        )
    )

    ;; Case D=2 (A-O2-D2). Current state D2.
    (:action visit_dublin_2d
        :parameters ()
        :precondition (and
            (A-O2-D2) (at dublin) 
            (D2)
            (not (visited dublin))
        )
        :effect (and
            (visited dublin)
            (not (D2)) (D4)
        )
    )
    
    ;; Case D=1 (A-O3-D1). Current state D3.
    (:action visit_dublin_1d
        :parameters ()
        :precondition (and
            (A-O3-D1) (at dublin) 
            (D3)
            (not (visited dublin))
        )
        :effect (and
            (visited dublin)
            (not (D3)) (D4)
        )
    )
    
    ;; 2d. Travel Dublin -> Valencia (Requires D duration spent)

    (:action travel_D_V
        :parameters ()
        :precondition (and
            (at dublin)
            (visited dublin)
            (connection dublin valencia)
            (not (visited valencia))
        )
        :effect (and
            (not (at dublin))
            (at valencia)
            (increase (total-cost) 1)
        )
    )
    
    ;; 2e. Visit Valencia (Fixed 5 days. Transitions D4 -> D9)
    ;; This ensures Valencia occupies Days 5 through 9.
    
    (:action visit_valencia_5d
        :parameters ()
        :precondition (and
            (at valencia)
            (D4)
            (not (visited valencia))
        )
        :effect (and
            (visited valencia)
            (not (D4)) (D9)
        )
    )