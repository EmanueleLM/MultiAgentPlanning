(define (problem tripplanningexample30)
    (:domain trip-planning)
    (:objects
        me - traveler
        istanbul tallinn zurich - location
        t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11 t_12 t_13 t_14 t_15 - time_point
        dc_ist_0 dc_ist_1 dc_ist_2 dc_ist_3 dc_ist_4 dc_ist_5 - day_count_ist
        dc_tal_0 dc_tal_1 dc_tal_2 dc_tal_3 dc_tal_4 - day_count_tal
        dc_zur_0 dc_zur_1 dc_zur_2 dc_zur_3 dc_zur_4 dc_zur_5 dc_zur_6 dc_zur_7 - day_count_zur
    )
    (:init
        ; Initial location (assuming Istanbul as starting city, problem doesn't explicitly state start)
        (is_at me istanbul)

        ; Location identities
        (is_istanbul istanbul)
        (is_tallinn tallinn)
        (is_zurich zurich)

        ; Current day and day sequence for total trip duration (14 days implies current_time reaches t_15)
        (current_time t_1)
        (next_time t_1 t_2)
        (next_time t_2 t_3)
        (next_time t_3 t_4)
        (next_time t_4 t_5)
        (next_time t_5 t_6)
        (next_time t_6 t_7)
        (next_time t_7 t_8)
        (next_time t_8 t_9)
        (next_time t_9 t_10)
        (next_time t_10 t_11)
        (next_time t_11 t_12)
        (next_time t_12 t_13)
        (next_time t_13 t_14)
        (next_time t_14 t_15)

        ; Initial day counts for cities
        (ist_days_spent dc_ist_0)
        (tal_days_spent dc_tal_0)
        (zur_days_spent dc_zur_0)

        ; Day count sequences for Istanbul (up to 5 days required)
        (next_ist_day_count dc_ist_0 dc_ist_1)
        (next_ist_day_count dc_ist_1 dc_ist_2)
        (next_ist_day_count dc_ist_2 dc_ist_3)
        (next_ist_day_count dc_ist_3 dc_ist_4)
        (next_ist_day_count dc_ist_4 dc_ist_5)

        ; Day count sequences for Tallinn (up to 4 days required)
        (next_tal_day_count dc_tal_0 dc_tal_1)
        (next_tal_day_count dc_tal_1 dc_tal_2)
        (next_tal_day_count dc_tal_2 dc_tal_3)
        (next_tal_day_count dc_tal_3 dc_tal_4)

        ; Day count sequences for Zurich (up to 7 days required)
        (next_zur_day_count dc_zur_0 dc_zur_1)
        (next_zur_day_count dc_zur_1 dc_zur_2)
        (next_zur_day_count dc_zur_2 dc_zur_3)
        (next_zur_day_count dc_zur_3 dc_zur_4)
        (next_zur_day_count dc_zur_4 dc_zur_5)
        (next_zur_day_count dc_zur_5 dc_zur_6)
        (next_zur_day_count dc_zur_6 dc_zur_7)

        ; Direct flights information (all specified connections are bidirectional)
        (has_direct_flight istanbul tallinn)
        (has_direct_flight istanbul zurich)
        (has_direct_flight tallinn zurich)
        (has_direct_flight tallinn istanbul)
        (has_direct_flight zurich istanbul)
        (has_direct_flight zurich tallinn)

        ; Show in Zurich runs from t_1 to t_7
        (show_is_happening t_1)
        (show_is_happening t_2)
        (show_is_happening t_3)
        (show_is_happening t_4)
        (show_is_happening t_5)
        (show_is_happening t_6)
        (show_is_happening t_7)

        ; Initialize total-cost for Fast Downwards
        (= (total-cost) 0)
    )
    (:goal (and
        (current_time t_15)            ; Represents that 14 days (actions) have passed
        (ist_days_spent dc_ist_5)  ; Must stay 5 days in Istanbul
        (tal_days_spent dc_tal_4)   ; Must visit Tallinn for 4 days
        (zur_days_spent dc_zur_7)    ; Must visit Zurich for 7 days
        (has_attended_zurich_show)          ; Must attend the show in Zurich
    ))
    (:metric minimize (total-cost))
)