(define (domain meeting-schedule)
    (:requirements :strips :typing :durative-actions :fluents :duration-inequalities)
    (:types location - object)

    (:predicates
        (at ?l - location)
        (ready-to-calculate-duration)
        (meeting-in-progress)
    )

    (:functions
        (current-time)
        (meeting-duration)
        (travel-time ?from - location ?to - location)
        (max-allowed-duration)
        (john-start-time) ; 780 (1:00 PM)
        (john-end-time) ; 1095 (6:15 PM)
    )

    (:durative-action travel)
        :parameters (?from - location ?to - location)
        :duration (= ?duration (travel-time ?from ?to))
        :condition
            (at start (at ?from))
        :effect
            (and
                (at start (not (at ?from)))
                (at end (at ?to))
                (at end (increase (current-time) ?duration))
                ; If we arrive at GGP, mark that we need to calculate remaining time
                (when (at end (at GGP)) (at end (ready-to-calculate-duration)))
            )

    (:durative-action wait_for_john)
        ; Wait exactly until John arrives at 780 minutes.
        :parameters ()
        :duration (= ?duration (- (john-start-time) (current-time)))
        :condition
            (and
                (at start (at GGP))
                (at start (< (current-time) (john-start-time)))
            )
        :effect
            (and
                ; Assign current-time directly to 780, ensuring exact start time
                (at end (assign (current-time) (john-start-time))) 
                (at end (ready-to-calculate-duration))
            )
    
    (:action calculate_max_duration)
        ; Instant action to set the constraint for the subsequent meeting duration based on remaining availability.
        :parameters ()
        :precondition
            (and
                (at GGP)
                (ready-to-calculate-duration)
                ; Ensure we are not past the end time when trying to calculate
                (<= (current-time) (john-end-time)) 
            )
        :effect
            (and
                (not (ready-to-calculate-duration))
                ; D_max = John_End_Time - Current_Time
                (assign (max-allowed-duration) (- (john-end-time) (current-time)))
            )


    (:durative-action meet_john)
        :parameters ()
        :duration (?duration)
        :condition
            (and
                (at start (at GGP))
                (at start (>= (current-time) (john-start-time)))
                (at start (not (meeting-in-progress)))
                
                ; Minimum 90 minutes constraint
                (>= ?duration 90)
                ; Maximum duration constraint (must respect John's departure time at 1095)
                (<= ?duration (max-allowed-duration))
            )
        :effect
            (and
                (at start (meeting-in-progress))
                (at end (not (meeting-in-progress)))
                (at end (increase (current-time) ?duration))
                (at end (increase (meeting-duration) ?duration))
            )
)