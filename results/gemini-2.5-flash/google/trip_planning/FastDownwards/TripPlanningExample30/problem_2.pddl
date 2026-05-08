(define (problem tripplanningexample30)
    (:domain trip-planning)
    (:objects
        me - person
        istanbul tallinn zurich - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
        dc_ist_0 dc_ist_1 dc_ist_2 dc_ist_3 dc_ist_4 dc_ist_5 - day_count_istanbul
        dc_tal_0 dc_tal_1 dc_tal_2 dc_tal_3 dc_tal_4 - day_count_tallinn
        dc_zur_0 dc_zur_1 dc_zur_2 dc_zur_3 dc_zur_4 dc_zur_5 dc_zur_6 dc_zur_7 - day_count_zurich
    )
    (:init
        ; Initial location (assuming Istanbul as starting city)
        (at me istanbul)

        ; Current day and day sequence for total trip duration (14 days implies current_day reaches day_15)
        (current_day day_1)
        (next_day_is day_1 day_2)
        (next_day_is day_2 day_3)
        (next_day_is day_3 day_4)
        (next_day_is day_4 day_5)
        (next_day_is day_5 day_6)
        (next_day_is day_6 day_7)
        (next_day_is day_7 day_8)
        (next_day_is day_8 day_9)
        (next_day_is day_9 day_10)
        (next_day_is day_10 day_11)
        (next_day_is day_11 day_12)
        (next_day_is day_12 day_13)
        (next_day_is day_13 day_14)
        (next_day_is day_14 day_15)

        ; Initial day counts for cities
        (istanbul_days_spent dc_ist_0)
        (tallinn_days_spent dc_tal_0)
        (zurich_days_spent dc_zur_0)

        ; Day count sequences for Istanbul (up to 5 days)
        (next_istanbul_day_count_is dc_ist_0 dc_ist_1)
        (next_istanbul_day_count_is dc_ist_1 dc_ist_2)
        (next_istanbul_day_count_is dc_ist_2 dc_ist_3)
        (next_istanbul_day_count_is dc_ist_3 dc_ist_4)
        (next_istanbul_day_count_is dc_ist_4 dc_ist_5)

        ; Day count sequences for Tallinn (up to 4 days)
        (next_tallinn_day_count_is dc_tal_0 dc_tal_1)
        (next_tallinn_day_count_is dc_tal_1 dc_tal_2)
        (next_tallinn_day_count_is dc_tal_2 dc_tal_3)
        (next_tallinn_day_count_is dc_tal_3 dc_tal_4)

        ; Day count sequences for Zurich (up to 7 days)
        (next_zurich_day_count_is dc_zur_0 dc_zur_1)
        (next_zurich_day_count_is dc_zur_1 dc_zur_2)
        (next_zurich_day_count_is dc_zur_2 dc_zur_3)
        (next_zurich_day_count_is dc_zur_3 dc_zur_4)
        (next_zurich_day_count_is dc_zur_4 dc_zur_5)
        (next_zurich_day_count_is dc_zur_5 dc_zur_6)
        (next_zurich_day_count_is dc_zur_6 dc_zur_7)

        ; Direct flights information
        (direct_flight istanbul tallinn)
        (direct_flight istanbul zurich)
        (direct_flight tallinn zurich)
        (direct_flight tallinn istanbul)
        (direct_flight zurich istanbul)
        (direct_flight zurich tallinn)

        ; Show in Zurich runs from day 1 to day 7
        (show_happening_on day_1)
        (show_happening_on day_2)
        (show_happening_on day_3)
        (show_happening_on day_4)
        (show_happening_on day_5)
        (show_happening_on day_6)
        (show_happening_on day_7)

        ; Initialize total-cost for Fast Downwards
        (= (total-cost) 0)
    )
    (:goal (and
        (current_day day_15) ; Represents that 14 days (actions) have passed
        (istanbul_days_spent dc_ist_5) ; Must stay 5 days in Istanbul
        (tallinn_days_spent dc_tal_4)   ; Must visit Tallinn for 4 days
        (zurich_days_spent dc_zur_7)    ; Must visit Zurich for 7 days
        (attended_zurich_show)          ; Must attend the show in Zurich
    ))
    (:metric minimize (total-cost))
)