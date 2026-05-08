(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        day_count_value
    )
    (:constants
        copenhagen vienna lyon - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
        zero_days one_day two_days three_days four_days five_days six_days seven_days eight_days nine_days ten_days eleven_days - day_count_value
    )
    (:predicates
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (at_city ?c - city)
        (connected ?c1 ?c2 - city)

        (cph_days_spent ?n - day_count_value)
        (vie_days_spent ?n - day_count_value)
        (lys_days_spent ?n - day_count_value)

        (succ_day_count ?n1 ?n2 - day_count_value)

        (conference_day1_cph_attended)
        (conference_day5_cph_stay_attended)
    )

    (:action move
        :parameters (?from ?to - city ?cd ?nd - day)
        :precondition (and
            (current_day ?cd)
            (at_city ?from)
            (connected ?from ?to)
            (next_day ?cd ?nd)
        )
        :effect (and
            (not (current_day ?cd))
            (current_day ?nd)
            (not (at_city ?from))
            (at_city ?to)
        )
    )

    (:action stay_cph_normal
        :parameters (?cd ?nd - day ?ocph ?ncph - day_count_value)
        :precondition (and
            (current_day ?cd)
            (at_city copenhagen)
            (next_day ?cd ?nd)
            (cph_days_spent ?ocph)
            (succ_day_count ?ocph ?ncph)
            (not (current_day d1)) ; Not Day 1 of the trip
            (not (cph_days_spent four_days)) ; Not the 5th day of CPH stay
        )
        :effect (and
            (not (current_day ?cd))
            (current_day ?nd)
            (not (cph_days_spent ?ocph))
            (cph_days_spent ?ncph)
        )
    )

    (:action stay_cph_attend_day1_conf
        :parameters (?nd - day ?ocph ?ncph - day_count_value)
        :precondition (and
            (current_day d1) ; Is Day 1 of the trip
            (at_city copenhagen)
            (next_day d1 ?nd)
            (cph_days_spent ?ocph)
            (succ_day_count ?ocph ?ncph)
            (not (conference_day1_cph_attended))
            (not (cph_days_spent four_days)) ; Not the 5th day of CPH stay
        )
        :effect (and
            (not (current_day d1))
            (current_day ?nd)
            (not (cph_days_spent ?ocph))
            (cph_days_spent ?ncph)
            (conference_day1_cph_attended)
        )
    )

    (:action stay_cph_attend_day5_cph_stay_conf
        :parameters (?cd ?nd - day ?ncph - day_count_value)
        :precondition (and
            (current_day ?cd)
            (at_city copenhagen)
            (next_day ?cd ?nd)
            (cph_days_spent four_days) ; Is the 4th day of CPH stay, so next will be 5th
            (succ_day_count four_days ?ncph)
            (not (conference_day5_cph_stay_attended))
            (not (current_day d1)) ; Not Day 1 of the trip
        )
        :effect (and
            (not (current_day ?cd))
            (current_day ?nd)
            (not (cph_days_spent four_days))
            (cph_days_spent ?ncph)
            (conference_day5_cph_stay_attended)
        )
    )

    (:action stay_cph_attend_both_confs
        :parameters (?nd - day ?ncph - day_count_value)
        :precondition (and
            (current_day d1) ; Is Day 1 of the trip
            (at_city copenhagen)
            (next_day d1 ?nd)
            (cph_days_spent four_days) ; Is the 4th day of CPH stay, so next will be 5th
            (succ_day_count four_days ?ncph)
            (not (conference_day1_cph_attended))
            (not (conference_day5_cph_stay_attended))
        )
        :effect (and
            (not (current_day d1))
            (current_day ?nd)
            (not (cph_days_spent four_days))
            (cph_days_spent ?ncph)
            (conference_day1_cph_attended)
            (conference_day5_cph_stay_attended)
        )
    )

    (:action stay_vie
        :parameters (?cd ?nd - day ?ovie ?nvie - day_count_value)
        :precondition (and
            (current_day ?cd)
            (at_city vienna)
            (next_day ?cd ?nd)
            (vie_days_spent ?ovie)
            (succ_day_count ?ovie ?nvie)
        )
        :effect (and
            (not (current_day ?cd))
            (current_day ?nd)
            (not (vie_days_spent ?ovie))
            (vie_days_spent ?nvie)
        )
    )

    (:action stay_lys
        :parameters (?cd ?nd - day ?olys ?nlys - day_count_value)
        :precondition (and
            (current_day ?cd)
            (at_city lyon)
            (next_day ?cd ?nd)
            (lys_days_spent ?olys)
            (succ_day_count ?olys ?nlys)
        )
        :effect (and
            (not (current_day ?cd))
            (current_day ?nd)
            (not (lys_days_spent ?olys))
            (lys_days_spent ?nlys)
        )
    )
)