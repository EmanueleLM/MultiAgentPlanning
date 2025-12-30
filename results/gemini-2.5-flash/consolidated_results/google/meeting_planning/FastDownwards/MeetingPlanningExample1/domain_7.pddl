(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)

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
        (betty-is-available)
    )

    (:functions
        (time-elapsed)
    )

    ; Travel time Richmond District (RD) to Financial District (FD): 22 minutes
    (:action travel-rd-to-fd
        :parameters ()
        :precondition (at richmond-district)
        :effect (and (not (at richmond-district))
                     (at financial-district)
                     (increase (time-elapsed) 22)
                )
    )

    ; Wait until Betty is available (T=495). 
    ; Traveler arrives at T=22. Wait duration required is 495 - 22 = 473 minutes.
    (:action wait-for-betty-start
        :parameters ()
        :precondition (and (at financial-district)
                           (not (betty-is-available))
                       )
        :effect (and (betty-is-available)
                     (increase (time-elapsed) 473)
                )
    )

    ; Meet Betty: Minimum 60 minutes duration required.
    (:action meet-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (betty-is-available)
                           (not (met betty))
                       )
        :effect (and (met betty)
                     (increase (time-elapsed) 60)
                )
    )

    ; Travel time Financial District (FD) to Richmond District (RD): 21 minutes
    (:action travel-fd-to-rd
        :parameters ()
        :precondition (at financial-district)
        :effect (and (not (at financial-district))
                     (at richmond-district)
                     (increase (time-elapsed) 21)
                )
    )
)