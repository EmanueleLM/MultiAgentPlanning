(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        count_santorini
        count_amsterdam
        count_istanbul
    )
    (:constants
        santorini amsterdam istanbul - city
    )
    (:predicates
        (at_location ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (stayed_on_day ?c - city ?d - day)

        ; Stay counts for each city
        (santorini_stays ?cs - count_santorini)
        (amsterdam_stays ?ca - count_amsterdam)
        (istanbul_stays ?ci - count_istanbul)

        ; Next count predicates
        (next_santorini_count ?cs_old - count_santorini ?cs_new - count_santorini)
        (next_amsterdam_count ?ca_old - count_amsterdam ?ca_new - count_amsterdam)
        (next_istanbul_count ?ci_old - count_istanbul ?ci_new - count_istanbul)
    )

    (:action spend_day_in_santorini
        :parameters (?d - day ?next_d - day ?cs_old - count_santorini ?cs_new - count_santorini)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location santorini)
            (santorini_stays ?cs_old)
            (next_santorini_count ?cs_old ?cs_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day santorini ?d)
            (not (santorini_stays ?cs_old))
            (santorini_stays ?cs_new)
        )
    )

    (:action spend_day_in_amsterdam
        :parameters (?d - day ?next_d - day ?ca_old - count_amsterdam ?ca_new - count_amsterdam)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location amsterdam)
            (amsterdam_stays ?ca_old)
            (next_amsterdam_count ?ca_old ?ca_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day amsterdam ?d)
            (not (amsterdam_stays ?ca_old))
            (amsterdam_stays ?ca_new)
        )
    )

    (:action spend_day_in_istanbul
        :parameters (?d - day ?next_d - day ?ci_old - count_istanbul ?ci_new - count_istanbul)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location istanbul)
            (istanbul_stays ?ci_old)
            (next_istanbul_count ?ci_old ?ci_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day istanbul ?d)
            (not (istanbul_stays ?ci_old))
            (istanbul_stays ?ci_new)
        )
    )

    (:action fly_from_amsterdam_to_santorini
        :parameters (?d - day ?next_d - day ?cs_old - count_santorini ?cs_new - count_santorini)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location amsterdam)
            (connected amsterdam santorini)
            (santorini_stays ?cs_old)
            (next_santorini_count ?cs_old ?cs_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (at_location amsterdam))
            (at_location santorini)
            (stayed_on_day santorini ?d) ; Travel day counts as arrival/stay day in destination
            (not (santorini_stays ?cs_old))
            (santorini_stays ?cs_new)
        )
    )

    (:action fly_from_santorini_to_amsterdam
        :parameters (?d - day ?next_d - day ?ca_old - count_amsterdam ?ca_new - count_amsterdam)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location santorini)
            (connected santorini amsterdam)
            (amsterdam_stays ?ca_old)
            (next_amsterdam_count ?ca_old ?ca_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (at_location santorini))
            (at_location amsterdam)
            (stayed_on_day amsterdam ?d) ; Travel day counts as arrival/stay day in destination
            (not (amsterdam_stays ?ca_old))
            (amsterdam_stays ?ca_new)
        )
    )

    (:action fly_from_istanbul_to_amsterdam
        :parameters (?d - day ?next_d - day ?ca_old - count_amsterdam ?ca_new - count_amsterdam)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location istanbul)
            (connected istanbul amsterdam)
            (amsterdam_stays ?ca_old)
            (next_amsterdam_count ?ca_old ?ca_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (at_location istanbul))
            (at_location amsterdam)
            (stayed_on_day amsterdam ?d) ; Travel day counts as arrival/stay day in destination
            (not (amsterdam_stays ?ca_old))
            (amsterdam_stays ?ca_new)
        )
    )

    (:action fly_from_amsterdam_to_istanbul
        :parameters (?d - day ?next_d - day ?ci_old - count_istanbul ?ci_new - count_istanbul)
        :precondition (and
            (current_day ?d)
            (next_day ?d ?next_d)
            (at_location amsterdam)
            (connected amsterdam istanbul)
            (istanbul_stays ?ci_old)
            (next_istanbul_count ?ci_old ?ci_new)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (not (at_location amsterdam))
            (at_location istanbul)
            (stayed_on_day istanbul ?d) ; Travel day counts as arrival/stay day in destination
            (not (istanbul_stays ?ci_old))
            (istanbul_stays ?ci_new)
        )
    )
)