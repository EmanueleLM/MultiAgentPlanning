(define (problem trip_planning_example17)
    (:domain trip_planning)
    (:objects) ; All objects are constants defined in the domain for this problem instance

    (:init
        (current_day d1)
        (at_city copenhagen) ; Start in Copenhagen to fulfill Day 1 conference

        ; Initial day counts for cities
        (cph_days_spent zero_days)
        (vie_days_spent zero_days)
        (lys_days_spent zero_days)

        ; Day count successor chain
        (succ_day_count zero_days one_day)
        (succ_day_count one_day two_days)
        (succ_day_count two_days three_days)
        (succ_day_count three_days four_days)
        (succ_day_count four_days five_days)
        (succ_day_count five_days six_days)
        (succ_day_count six_days seven_days)
        (succ_day_count seven_days eight_days)
        (succ_day_count eight_days nine_days)
        (succ_day_count nine_days ten_days)
        (succ_day_count ten_days eleven_days)

        ; Global day successor chain (10 transitions from d1 to d11 for 11 days total)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)
        (next_day d10 d11)

        ; Direct flight connections (bidirectional)
        (connected copenhagen vienna)
        (connected vienna copenhagen)
        (connected vienna lyon)
        (connected lyon vienna)
        ; No direct connection between Copenhagen and Lyon
    )
    (:goal (and
        (current_day d11) ; The trip must end after 11 calendar days
        (cph_days_spent five_days) ; Copenhagen must be visited for 5 days
        (vie_days_spent one_day) ; Vienna must be visited for 1 day (1+2=3 days for VIE/LYS)
        (lys_days_spent two_days) ; Lyon must be visited for 2 days (1+2=3 days for VIE/LYS)
        (conference_day1_cph_attended) ; Conference on Day 1 must be attended
        (conference_day5_cph_stay_attended) ; Conference on 5th Copenhagen stay day must be attended
    ))
)