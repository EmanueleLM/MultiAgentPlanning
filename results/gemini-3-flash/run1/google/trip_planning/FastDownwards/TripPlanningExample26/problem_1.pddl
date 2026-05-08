(define (problem trip_planning_example_26)
        (:domain trip_planning)
        (:objects
            porto berlin reykjavik - city
            day_01 day_02 day_03 day_04 day_05 day_06 day_07 day_08 day_09 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
        )
        (:init
            ;; Initial location on the first day
            (at porto day_01)

            ;; Temporal sequence
            (next day_01 day_02) (next day_02 day_03) (next day_03 day_04) (next day_04 day_05)
            (next day_05 day_06) (next day_06 day_07) (next day_07 day_08) (next day_08 day_09)
            (next day_09 day_10) (next day_10 day_11) (next day_11 day_12) (next day_12 day_13)
            (next day_13 day_14) (next day_14 day_15) (next day_15 day_16)

            ;; Flight connections
            (connected porto berlin) (connected berlin porto)
            (connected berlin reykjavik) (connected reykjavik berlin)

            ;; Friend meeting window
            (between_12_16 day_12)
            (between_12_16 day_13)
            (between_12_16 day_14)
            (between_12_16 day_15)
            (between_12_16 day_16)
        )
        (:goal
            (and
                ;; Porto: 7 days (Days 1 to 7)
                (spent porto day_01) (spent porto day_02) (spent porto day_03)
                (spent porto day_04) (spent porto day_05) (spent porto day_06)
                (spent porto day_07)

                ;; Berlin: 6 days (Days 7 to 12)
                (spent berlin day_07) (spent berlin day_08) (spent berlin day_09)
                (spent berlin day_10) (spent berlin day_11) (spent berlin day_12)

                ;; Reykjavik: 5 days (Days 12 to 16)
                (spent reykjavik day_12) (spent reykjavik day_13) (spent reykjavik day_14)
                (spent reykjavik day_15) (spent reykjavik day_16)

                ;; Friend meeting constraint
                (friend_met)
            )
        )
    )