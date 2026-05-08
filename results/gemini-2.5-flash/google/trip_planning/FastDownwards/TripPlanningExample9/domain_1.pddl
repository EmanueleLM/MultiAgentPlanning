(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        traveler - object
        city - object
        day - object
    )

    (:predicates
        (at ?t - traveler ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (visited ?c - city) ; Marks that at least one day was spent in this city
        (is_workshop_day ?d - day) ; Marks days when the workshop is held
        (attended_workshop) ; True if the workshop has been attended
    )

    (:actions
        ;; Action to fly from one city to another
        ;; Assumes travel takes one full day, arriving at the destination on the next day.
        (fly
            ?t - traveler
            ?from - city
            ?to - city
            ?d_current - day
            ?d_next - day
        )
        (:precondition
            (and
                (current_day ?d_current)
                (at ?t ?from)
                (connected ?from ?to)
                (next_day ?d_current ?d_next)
            )
        )
        (:effect
            (and
                (not (at ?t ?from))
                (at ?t ?to)
                (not (current_day ?d_current))
                (current_day ?d_next)
            )
        )

        ;; Action to stay in Stuttgart and attend the workshop
        (stay_in_stuttgart_and_attend_workshop
            ?t - traveler
            ?d_current - day
            ?d_next - day
        )
        (:precondition
            (and
                (current_day ?d_current)
                (at ?t stuttgart)
                (next_day ?d_current ?d_next)
                (is_workshop_day ?d_current)
                (not (attended_workshop)) ; Only attend once
            )
        )
        (:effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited stuttgart)
                (attended_workshop)
            )
        )

        ;; Action to stay in Stuttgart, but workshop is either not today or already attended
        (stay_in_stuttgart
            ?t - traveler
            ?d_current - day
            ?d_next - day
        )
        (:precondition
            (and
                (current_day ?d_current)
                (at ?t stuttgart)
                (next_day ?d_current ?d_next)
                (or (not (is_workshop_day ?d_current)) (attended_workshop)) ; Workshop not possible or already done
            )
        )
        (:effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited stuttgart)
            )
        )

        ;; Action to stay in any other city
        (stay_in_other_city
            ?t - traveler
            ?c - city
            ?d_current - day
            ?d_next - day
        )
        (:precondition
            (and
                (current_day ?d_current)
                (at ?t ?c)
                (next_day ?d_current ?d_next)
                (not (= ?c stuttgart)) ; Ensure this action is not for Stuttgart
            )
        )
        (:effect
            (and
                (not (current_day ?d_current))
                (current_day ?d_next)
                (visited ?c)
            )
        )
    )
)