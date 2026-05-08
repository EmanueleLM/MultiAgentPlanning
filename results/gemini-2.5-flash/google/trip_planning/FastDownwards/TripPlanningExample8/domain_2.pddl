(define (domain trip_planning_example_8)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        days_count
    )
    (:constants
        krakow athens zurich - city
        day_0 day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day
        c_0 c_1 c_2 c_3 c_4 c_5 c_6 c_7 - days_count
    )
    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (current_day ?d - day)
        (krakow_days_left ?n - days_count)
        (athens_days_left ?n - days_count)
        (zurich_days_left ?n - days_count)
        (day_succ ?d1 - day ?d2 - day) ; d1 is predecessor of d2
        (count_succ ?c1 - days_count ?c2 - days_count) ; c1 is predecessor of c2 (c2 = c1 + 1), for decrementing
    )

    ;; Action for traveling between cities.
    ;; Travel does not consume a day, only changes location.
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and (at ?from)
                           (connected ?from ?to))
        :effect (and (not (at ?from))
                     (at ?to)))

    ;; Actions for staying in Krakow, decrementing days_left and advancing current_day.
    (:action stay_day_at_krakow_6_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_6)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_6))
                     (krakow_days_left c_5)))

    (:action stay_day_at_krakow_5_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_5)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_5))
                     (krakow_days_left c_4)))

    (:action stay_day_at_krakow_4_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_4)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_4))
                     (krakow_days_left c_3)))

    (:action stay_day_at_krakow_3_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_3)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_3))
                     (krakow_days_left c_2)))

    (:action stay_day_at_krakow_2_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_2)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_2))
                     (krakow_days_left c_1)))

    (:action stay_day_at_krakow_1_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at krakow)
                           (current_day ?d_curr)
                           (krakow_days_left c_1)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (krakow_days_left c_1))
                     (krakow_days_left c_0)))

    ;; Actions for staying in Athens, with the strict D1-D7 constraint.
    ;; These actions ensure the 7-day Athens stay occurs consecutively from Day 1 to Day 7.
    (:action stay_day_at_athens_7_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_1
        :precondition (and (at athens)
                           (current_day day_1)
                           (athens_days_left c_7)
                           (day_succ day_1 ?d_next))
        :effect (and (not (current_day day_1))
                     (current_day ?d_next)
                     (not (athens_days_left c_7))
                     (athens_days_left c_6)))

    (:action stay_day_at_athens_6_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_2
        :precondition (and (at athens)
                           (current_day day_2)
                           (athens_days_left c_6)
                           (day_succ day_2 ?d_next))
        :effect (and (not (current_day day_2))
                     (current_day ?d_next)
                     (not (athens_days_left c_6))
                     (athens_days_left c_5)))

    (:action stay_day_at_athens_5_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_3
        :precondition (and (at athens)
                           (current_day day_3)
                           (athens_days_left c_5)
                           (day_succ day_3 ?d_next))
        :effect (and (not (current_day day_3))
                     (current_day ?d_next)
                     (not (athens_days_left c_5))
                     (athens_days_left c_4)))

    (:action stay_day_at_athens_4_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_4
        :precondition (and (at athens)
                           (current_day day_4)
                           (athens_days_left c_4)
                           (day_succ day_4 ?d_next))
        :effect (and (not (current_day day_4))
                     (current_day ?d_next)
                     (not (athens_days_left c_4))
                     (athens_days_left c_3)))

    (:action stay_day_at_athens_3_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_5
        :precondition (and (at athens)
                           (current_day day_5)
                           (athens_days_left c_3)
                           (day_succ day_5 ?d_next))
        :effect (and (not (current_day day_5))
                     (current_day ?d_next)
                     (not (athens_days_left c_3))
                     (athens_days_left c_2)))

    (:action stay_day_at_athens_2_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_6
        :precondition (and (at athens)
                           (current_day day_6)
                           (athens_days_left c_2)
                           (day_succ day_6 ?d_next))
        :effect (and (not (current_day day_6))
                     (current_day ?d_next)
                     (not (athens_days_left c_2))
                     (athens_days_left c_1)))

    (:action stay_day_at_athens_1_left
        :parameters (?d_next - day) ; ?d_curr is implicitly day_7
        :precondition (and (at athens)
                           (current_day day_7)
                           (athens_days_left c_1)
                           (day_succ day_7 ?d_next))
        :effect (and (not (current_day day_7))
                     (current_day ?d_next)
                     (not (athens_days_left c_1))
                     (athens_days_left c_0)))

    ;; Actions for staying in Zurich, decrementing days_left and advancing current_day.
    (:action stay_day_at_zurich_5_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at zurich)
                           (current_day ?d_curr)
                           (zurich_days_left c_5)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (zurich_days_left c_5))
                     (zurich_days_left c_4)))

    (:action stay_day_at_zurich_4_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at zurich)
                           (current_day ?d_curr)
                           (zurich_days_left c_4)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (zurich_days_left c_4))
                     (zurich_days_left c_3)))

    (:action stay_day_at_zurich_3_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at zurich)
                           (current_day ?d_curr)
                           (zurich_days_left c_3)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (zurich_days_left c_3))
                     (zurich_days_left c_2)))

    (:action stay_day_at_zurich_2_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at zurich)
                           (current_day ?d_curr)
                           (zurich_days_left c_2)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (zurich_days_left c_2))
                     (zurich_days_left c_1)))

    (:action stay_day_at_zurich_1_left
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and (at zurich)
                           (current_day ?d_curr)
                           (zurich_days_left c_1)
                           (day_succ ?d_curr ?d_next))
        :effect (and (not (current_day ?d_curr))
                     (current_day ?d_next)
                     (not (zurich_days_left c_1))
                     (zurich_days_left c_0)))
)