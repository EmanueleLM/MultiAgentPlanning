(define (problem travel_plan_instance)
    (:domain travel_plan)
    
    (:objects
        porto berlin reykjavik - city
        day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
        day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
    )

    (:init
        (at porto day_1)
        (next day_1 day_2) (next day_2 day_3) (next day_3 day_4)
        (next day_4 day_5) (next day_5 day_6) (next day_6 day_7)
        (next day_7 day_8) (next day_8 day_9) (next day_9 day_10)
        (next day_10 day_11) (next day_11 day_12) (next day_12 day_13)
        (next day_13 day_14) (next day_14 day_15) (next day_15 day_16)
        (meeting_day day_12) (meeting_day day_13)
        (meeting_day day_14) (meeting_day day_15) (meeting_day day_16)
    )

    (:goal (and
        (at reykjavik day_16)
        (visited porto)
        (visited berlin)
        (visited reykjavik)
        (or
            (at reykjavik day_12)
            (at reykjavik day_13)
            (at reykjavik day_14)
            (at reykjavik day_15)
            (at reykjavik day_16)
        )
    ))
)