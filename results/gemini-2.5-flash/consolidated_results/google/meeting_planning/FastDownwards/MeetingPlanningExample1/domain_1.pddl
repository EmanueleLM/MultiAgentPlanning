(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :fluents)

    (:types
        location
        friend
    )

    (:constants
        richmond-district - location
        financial-district - location
        betty - friend
    )

    (:predicates
        (at ?l - location)
        (met ?f - friend)
        (meeting-started ?f - friend)
    )

    (:functions
        (current-time) ; Time in minutes from midnight
    )

    ; Travel time Richmond District (RD) to Financial District (FD): 22 minutes
    (:action travel-rd-to-fd
        :parameters ()
        :precondition (and (at richmond-district)
                           (not (meeting-started betty))
                       )
        :effect (and (not (at richmond-district))
                     (at financial-district)
                     (increase (current-time) 22)
                )
    )

    ; Travel time FD to RD: 21 minutes (Not strictly needed for the required goal, but included for completeness)
    (:action travel-fd-to-rd
        :parameters ()
        :precondition (and (at financial-district)
                           (not (meeting-started betty))
                       )
        :effect (and (not (at financial-district))
                     (at richmond-district)
                     (increase (current-time) 21)
                )
    )

    ; Allows the traveler to wait at the Financial District until Betty is available (1035 minutes)
    (:action wait-for-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (< (current-time) 1035)
                       )
        :effect (assign (current-time) 1035)
    )

    ; Start meeting Betty (Availability starts at 1035, ends at 1185)
    (:action start-meeting-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (not (met betty))
                           (not (meeting-started betty))
                           (>= (current-time) 1035)
                           (< (current-time) 1185)
                       )
        :effect (meeting-started betty)
    )

    ; End meeting Betty (Enforcing minimum 60 minutes duration and end time constraint 1185)
    (:action end-meeting-betty
        :parameters ()
        :precondition (and (meeting-started betty)
                           ; Check that current time + 60 minutes (minimum duration) does not exceed 1185 (9:45 PM)
                           (<= (+ (current-time) 60) 1185)
                       )
        :effect (and (met betty)
                     (not (meeting-started betty))
                     ; Advance time by the required minimum meeting duration
                     (increase (current-time) 60)
                )
    )
)