(define (domain meeting-planning-domain)
    (:requirements :strips :typing :negative-preconditions :fluents :action-costs)

    (:types
        location
        friend
    )

    (:predicates
        (at ?l - location)
        (is-met ?f - friend)
    )

    (:functions
        (current-time) ; minutes from midnight (00:00)
        (total-friends-met) ; count of friends met
        (travel-cost) ; cumulative travel time for metric minimization
    )

    ;; Action to travel from Richmond District to Financial District
    ;; Travel time: 22 minutes
    (:action travel-richmond-financial
        :parameters ()
        :precondition (and (at richmond-district)
                           (not (at financial-district)))
        :effect (and (not (at richmond-district))
                     (at financial-district)
                     (increase (current-time) 22)
                     (increase (travel-cost) 22))
    )

    ;; Action to travel from Financial District to Richmond District
    ;; Travel time: 21 minutes
    (:action travel-financial-richmond
        :parameters ()
        :precondition (and (at financial-district)
                           (not (at richmond-district)))
        :effect (and (not (at financial-district))
                     (at richmond-district)
                     (increase (current-time) 21)
                     (increase (travel-cost) 21))
    )

    ;; Action to meet Betty
    ;; Betty is at Financial District from 5:15 PM to 9:45 PM.
    ;; Meeting duration is a minimum of 60 minutes.
    (:action meet-betty
        :parameters ()
        :precondition (and (at financial-district)
                           (not (is-met betty))
                           ;; Betty available from 5:15 PM (17 * 60 + 15 = 1035 minutes)
                           (>= (current-time) 1035) ; Corrected from 1020
                           ;; Meeting duration is 60 minutes.
                           ;; The meeting must end by 9:45 PM (21 * 60 + 45 = 1245 minutes)
                           (<= (+ (current-time) 60) 1245)
                      )
        :effect (and (is-met betty)
                     (increase (current-time) 60) ; Minimum meeting duration
                     (increase (total-friends-met) 1))
    )
)