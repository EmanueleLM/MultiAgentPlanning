(define (domain meeting-planning)
    (:requirements :typing :durative-actions :fluents :negative-preconditions)
    (:types 
        location - object
    )
    
    (:predicates
        (at ?l - location) ; Visitor is at location L
        (met_John)        ; Goal achieved: met John for the required duration
    )
    
    (:functions
        (current-time)
    )

    ; Travel from Richmond District (RD) to North Beach (NB) - 17 minutes
    (:durative-action travel_RD_NB
        :parameters ()
        :duration (= ?duration 17)
        :condition (and 
            (at start (at RichmondDistrict))
        )
        :effect (and 
            (at start (not (at RichmondDistrict)))
            (at end (at NorthBeach))
        )
    )

    ; Travel from North Beach (NB) to Richmond District (RD) - 18 minutes
    (:durative-action travel_NB_RD
        :parameters ()
        :duration (= ?duration 18)
        :condition (and 
            (at start (at NorthBeach))
        )
        :effect (and 
            (at start (not (at NorthBeach)))
            (at end (at RichmondDistrict))
        )
    )

    ; Meeting John at North Beach
    ; Availability: 3:15 PM (375 minutes) to 5:15 PM (495 minutes)
    ; Required minimum duration: 75 minutes
    (:durative-action meet_John
        :parameters ()
        :duration (>= ?duration 75) 
        
        :condition (and 
            (at start (at NorthBeach)) 
            ; Availability constraints
            (at start (>= (current-time) 375)) 
            (at end (<= (current-time) 495))   
        )
        :effect (and 
            (at end (met_John))
        )
    )
)