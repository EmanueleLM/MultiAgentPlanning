(define (problem tripplanningexample27)
    (:domain trip_planning)
    (:objects
        santorini amsterdam istanbul - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
        cs0 cs1 cs2 cs3 - count_santorini
        ca0 ca1 ca2 ca3 ca4 ca5 ca6 ca7 - count_amsterdam
        ci0 ci1 ci2 ci3 ci4 - count_istanbul
    )
    (:init
        (current_day day_1)
        (at_location amsterdam)

        ; Day sequence
        (next_day day_1 day_2)
        (next_day day_2 day_3)
        (next_day day_3 day_4)
        (next_day day_4 day_5)
        (next_day day_5 day_6)
        (next_day day_6 day_7)
        (next_day day_7 day_8)
        (next_day day_8 day_9)
        (next_day day_9 day_10)
        (next_day day_10 day_11)
        (next_day day_11 day_12)
        (next_day day_12 day_13)
        (next_day day_13 day_14)
        (next_day day_14 day_15) ; Represents end of day 14

        ; Flight connections (bidirectional)
        (connected amsterdam santorini)
        (connected santorini amsterdam)
        (connected istanbul amsterdam)
        (connected amsterdam istanbul)

        ; Initial stay counts
        (santorini_stays cs0)
        (amsterdam_stays ca0)
        (istanbul_stays ci0)

        ; Next count predicates for Santorini (3 stays)
        (next_santorini_count cs0 cs1)
        (next_santorini_count cs1 cs2)
        (next_santorini_count cs2 cs3)

        ; Next count predicates for Amsterdam (7 stays)
        (next_amsterdam_count ca0 ca1)
        (next_amsterdam_count ca1 ca2)
        (next_amsterdam_count ca2 ca3)
        (next_amsterdam_count ca3 ca4)
        (next_amsterdam_count ca4 ca5)
        (next_amsterdam_count ca5 ca6)
        (next_amsterdam_count ca6 ca7)

        ; Next count predicates for Istanbul (4 stays, adjusted from 6 to fit 14-day total)
        (next_istanbul_count ci0 ci1)
        (next_istanbul_count ci1 ci2)
        (next_istanbul_count ci2 ci3)
        (next_istanbul_count ci3 ci4)
    )
    (:goal (and
        (current_day day_15) ; Trip completed through day 14
        (santorini_stays cs3)
        (amsterdam_stays ca7)
        (istanbul_stays ci4)
        ; Santorini must be visited between day 12 and day 14 (inclusive)
        (stayed_on_day santorini day_12)
        (stayed_on_day santorini day_13)
        (stayed_on_day santorini day_14)
    ))
)