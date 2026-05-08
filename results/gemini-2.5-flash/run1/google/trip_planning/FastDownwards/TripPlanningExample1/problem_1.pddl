(define (problem trip_planning_example1_problem)
    (:domain trip_planning_example1)
    (:objects
        ; Cities
        riga manchester split - city

        ; Total day markers (from 0 to 15 days)
        td0 td1 td2 td3 td4 td5 td6 td7 td8 td9 td10 td11 td12 td13 td14 td15 - total_day_marker

        ; Duration slots (representing 1 to 7 days that can be spent in a city)
        ; ds7 is chosen because the maximum requested duration for a single city is 7 days (Riga).
        ds1 ds2 ds3 ds4 ds5 ds6 ds7 - duration_slot
    )

    (:init
        ; Initial location (arbitrarily chosen as Riga, as no specific starting point is mentioned)
        (at riga)

        ; Current total days starts at 0
        (current_total_days td0)

        ; Direct flight connections as specified
        (has_direct_flight riga manchester)
        (has_direct_flight manchester riga) ; Riga <-> Manchester (bidirectional)
        (has_direct_flight manchester split) ; Manchester -> Split (unidirectional)

        ; Predicates for next_total_day_amount: Defines all possible day increments for the total trip duration
        ; This is effectively an addition table for total_day_marker + duration_slot = new_total_day_marker
        ; Entries are only included if the resulting total_day_marker does not exceed td15.

        ; For ds1 (spending 1 day)
        (next_total_day_amount td0 ds1 td1) (next_total_day_amount td1 ds1 td2) (next_total_day_amount td2 ds1 td3)
        (next_total_day_amount td3 ds1 td4) (next_total_day_amount td4 ds1 td5) (next_total_day_amount td5 ds1 td6)
        (next_total_day_amount td6 ds1 td7) (next_total_day_amount td7 ds1 td8) (next_total_day_amount td8 ds1 td9)
        (next_total_day_amount td9 ds1 td10) (next_total_day_amount td10 ds1 td11) (next_total_day_amount td11 ds1 td12)
        (next_total_day_amount td12 ds1 td13) (next_total_day_amount td13 ds1 td14) (next_total_day_amount td14 ds1 td15)

        ; For ds2 (spending 2 days)
        (next_total_day_amount td0 ds2 td2) (next_total_day_amount td1 ds2 td3) (next_total_day_amount td2 ds2 td4)
        (next_total_day_amount td3 ds2 td5) (next_total_day_amount td4 ds2 td6) (next_total_day_amount td5 ds2 td7)
        (next_total_day_amount td6 ds2 td8) (next_total_day_amount td7 ds2 td9) (next_total_day_amount td8 ds2 td10)
        (next_total_day_amount td9 ds2 td11) (next_total_day_amount td10 ds2 td12) (next_total_day_amount td11 ds2 td13)
        (next_total_day_amount td12 ds2 td14) (next_total_day_amount td13 ds2 td15)

        ; For ds3 (spending 3 days)
        (next_total_day_amount td0 ds3 td3) (next_total_day_amount td1 ds3 td4) (next_total_day_amount td2 ds3 td5)
        (next_total_day_amount td3 ds3 td6) (next_total_day_amount td4 ds3 td7) (next_total_day_amount td5 ds3 td8)
        (next_total_day_amount td6 ds3 td9) (next_total_day_amount td7 ds3 td10) (next_total_day_amount td8 ds3 td11)
        (next_total_day_amount td9 ds3 td12) (next_total_day_amount td10 ds3 td13) (next_total_day_amount td11 ds3 td14)
        (next_total_day_amount td12 ds3 td15)

        ; For ds4 (spending 4 days)
        (next_total_day_amount td0 ds4 td4) (next_total_day_amount td1 ds4 td5) (next_total_day_amount td2 ds4 td6)
        (next_total_day_amount td3 ds4 td7) (next_total_day_amount td4 ds4 td8) (next_total_day_amount td5 ds4 td9)
        (next_total_day_amount td6 ds4 td10) (next_total_day_amount td7 ds4 td11) (next_total_day_amount td8 ds4 td12)
        (next_total_day_amount td9 ds4 td13) (next_total_day_amount td10 ds4 td14) (next_total_day_amount td11 ds4 td15)

        ; For ds5 (spending 5 days)
        (next_total_day_amount td0 ds5 td5) (next_total_day_amount td1 ds5 td6) (next_total_day_amount td2 ds5 td7)
        (next_total_day_amount td3 ds5 td8) (next_total_day_amount td4 ds5 td9) (next_total_day_amount td5 ds5 td10)
        (next_total_day_amount td6 ds5 td11) (next_total_day_amount td7 ds5 td12) (next_total_day_amount td8 ds5 td13)
        (next_total_day_amount td9 ds5 td14) (next_total_day_amount td10 ds5 td15)

        ; For ds6 (spending 6 days)
        (next_total_day_amount td0 ds6 td6) (next_total_day_amount td1 ds6 td7) (next_total_day_amount td2 ds6 td8)
        (next_total_day_amount td3 ds6 td9) (next_total_day_amount td4 ds6 td10) (next_total_day_amount td5 ds6 td11)
        (next_total_day_amount td6 ds6 td12) (next_total_day_amount td7 ds6 td13) (next_total_day_amount td8 ds6 td14)
        (next_total_day_amount td9 ds6 td15)

        ; For ds7 (spending 7 days)
        (next_total_day_amount td0 ds7 td7) (next_total_day_amount td1 ds7 td8) (next_total_day_amount td2 ds7 td9)
        (next_total_day_amount td3 ds7 td10) (next_total_day_amount td4 ds7 td11) (next_total_day_amount td5 ds7 td12)
        (next_total_day_amount td6 ds7 td13) (next_total_day_amount td7 ds7 td14) (next_total_day_amount td8 ds7 td15)
    )

    (:goal (and
        (current_total_days td15) ; Exactly 15 days must be spent
        (visited riga)
        (visited manchester)
        (visited split)
    ))
)