(define (problem trip_planning_example1_problem)
    (:domain trip_planning_example1)
    (:objects
        ; Cities
        riga manchester split - city

        ; Total day markers (from 0 to 15 days)
        td0 td1 td2 td3 td4 td5 td6 td7 td8 td9 td10 td11 td12 td13 td14 td15 - total_day_marker

        ; Duration slots (representing 1 to 7 days that can be spent in a city)
        duration_slot_1 duration_slot_2 duration_slot_3 duration_slot_4 duration_slot_5 duration_slot_6 duration_slot_7 - duration_slot
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

        ; For duration_slot_1 (spending 1 day)
        (next_total_day_amount td0 duration_slot_1 td1) (next_total_day_amount td1 duration_slot_1 td2) (next_total_day_amount td2 duration_slot_1 td3)
        (next_total_day_amount td3 duration_slot_1 td4) (next_total_day_amount td4 duration_slot_1 td5) (next_total_day_amount td5 duration_slot_1 td6)
        (next_total_day_amount td6 duration_slot_1 td7) (next_total_day_amount td7 duration_slot_1 td8) (next_total_day_amount td8 duration_slot_1 td9)
        (next_total_day_amount td9 duration_slot_1 td10) (next_total_day_amount td10 duration_slot_1 td11) (next_total_day_amount td11 duration_slot_1 td12)
        (next_total_day_amount td12 duration_slot_1 td13) (next_total_day_amount td13 duration_slot_1 td14) (next_total_day_amount td14 duration_slot_1 td15)

        ; For duration_slot_2 (spending 2 days)
        (next_total_day_amount td0 duration_slot_2 td2) (next_total_day_amount td1 duration_slot_2 td3) (next_total_day_amount td2 duration_slot_2 td4)
        (next_total_day_amount td3 duration_slot_2 td5) (next_total_day_amount td4 duration_slot_2 td6) (next_total_day_amount td5 duration_slot_2 td7)
        (next_total_day_amount td6 duration_slot_2 td8) (next_total_day_amount td7 duration_slot_2 td9) (next_total_day_amount td8 duration_slot_2 td10)
        (next_total_day_amount td9 duration_slot_2 td11) (next_total_day_amount td10 duration_slot_2 td12) (next_total_day_amount td11 duration_slot_2 td13)
        (next_total_day_amount td12 duration_slot_2 td14) (next_total_day_amount td13 duration_slot_2 td15)

        ; For duration_slot_3 (spending 3 days)
        (next_total_day_amount td0 duration_slot_3 td3) (next_total_day_amount td1 duration_slot_3 td4) (next_total_day_amount td2 duration_slot_3 td5)
        (next_total_day_amount td3 duration_slot_3 td6) (next_total_day_amount td4 duration_slot_3 td7) (next_total_day_amount td5 duration_slot_3 td8)
        (next_total_day_amount td6 duration_slot_3 td9) (next_total_day_amount td7 duration_slot_3 td10) (next_total_day_amount td8 duration_slot_3 td11)
        (next_total_day_amount td9 duration_slot_3 td12) (next_total_day_amount td10 duration_slot_3 td13) (next_total_day_amount td11 duration_slot_3 td14)
        (next_total_day_amount td12 duration_slot_3 td15)

        ; For duration_slot_4 (spending 4 days)
        (next_total_day_amount td0 duration_slot_4 td4) (next_total_day_amount td1 duration_slot_4 td5) (next_total_day_amount td2 duration_slot_4 td6)
        (next_total_day_amount td3 duration_slot_4 td7) (next_total_day_amount td4 duration_slot_4 td8) (next_total_day_amount td5 duration_slot_4 td9)
        (next_total_day_amount td6 duration_slot_4 td10) (next_total_day_amount td7 duration_slot_4 td11) (next_total_day_amount td8 duration_slot_4 td12)
        (next_total_day_amount td9 duration_slot_4 td13) (next_total_day_amount td10 duration_slot_4 td14) (next_total_day_amount td11 duration_slot_4 td15)

        ; For duration_slot_5 (spending 5 days)
        (next_total_day_amount td0 duration_slot_5 td5) (next_total_day_amount td1 duration_slot_5 td6) (next_total_day_amount td2 duration_slot_5 td7)
        (next_total_day_amount td3 duration_slot_5 td8) (next_total_day_amount td4 duration_slot_5 td9) (next_total_day_amount td5 duration_slot_5 td10)
        (next_total_day_amount td6 duration_slot_5 td11) (next_total_day_amount td7 duration_slot_5 td12) (next_total_day_amount td8 duration_slot_5 td13)
        (next_total_day_amount td9 duration_slot_5 td14) (next_total_day_amount td10 duration_slot_5 td15)

        ; For duration_slot_6 (spending 6 days)
        (next_total_day_amount td0 duration_slot_6 td6) (next_total_day_amount td1 duration_slot_6 td7) (next_total_day_amount td2 duration_slot_6 td8)
        (next_total_day_amount td3 duration_slot_6 td9) (next_total_day_amount td4 duration_slot_6 td10) (next_total_day_amount td5 duration_slot_6 td11)
        (next_total_day_amount td6 duration_slot_6 td12) (next_total_day_amount td7 duration_slot_6 td13) (next_total_day_amount td8 duration_slot_6 td14)
        (next_total_day_amount td9 duration_slot_6 td15)

        ; For duration_slot_7 (spending 7 days)
        (next_total_day_amount td0 duration_slot_7 td7) (next_total_day_amount td1 duration_slot_7 td8) (next_total_day_amount td2 duration_slot_7 td9)
        (next_total_day_amount td3 duration_slot_7 td10) (next_total_day_amount td4 duration_slot_7 td11) (next_total_day_amount td5 duration_slot_7 td12)
        (next_total_day_amount td6 duration_slot_7 td13) (next_total_day_amount td7 duration_slot_7 td14) (next_total_day_amount td8 duration_slot_7 td15)
    )

    (:goal (and
        (current_total_days td15) ; Exactly 15 days must be spent
        (visited riga)
        (visited manchester)
        (visited split)
    ))
)