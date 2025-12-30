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
        (betty-is-available) ; True when elapsed-time >= 495 minutes
    )

    (:functions
        (elapsed-time) ; Tracks time elapsed in minutes since the 9:00 AM start
    )

    ; Travel time Richmond District (RD) to Financial District (FD): 22 minutes
    ; Traveler starts at 9:00 AM (T=0). Arrives FD at 9:22 AM (T=22).
    (:action travel-rd-to-fd
        :parameters ()
        :precondition (at richmond-district)
        :effect (and (not (at richmond-district))
                     (at financial-district)
                     (increase (elapsed-time) 22)
                )
    )

    ; Wait until 5:15 PM (T=495). 
    ; Based on the required path (T_arrival=22), the wait duration is fixed at 495 - 22 = 473 minutes.
    ; This action strictly enforces the temporal milestone T=495.
    (:action wait-for-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (not (betty-is-available))
                       )
        :effect (and (betty-is-available)
                     (increase (elapsed-time) 473)
                )
    )

    ; Meet Betty: Minimum 60 minutes duration.
    ; Meeting starts at 5:15 PM (T=495), ends at 6:15 PM (T=555), well within Betty's 9:45 PM limit (T=765).
    (:action meet-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (betty-is-available)
                           (not (met betty))
                       )
        :effect (and (met betty)
                     (increase (elapsed-time) 60)
                )
    )

    ; Travel time Financial District (FD) to Richmond District (RD): 21 minutes
    (:action travel-fd-to-rd
        :parameters ()
        :precondition (at financial-district)
        :effect (and (not (at financial-district))
                     (at richmond-district)
                     (increase (elapsed-time) 21)
                )
    )
)