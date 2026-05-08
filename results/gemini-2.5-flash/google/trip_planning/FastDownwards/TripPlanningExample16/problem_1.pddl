(define (problem trip_planning_example16)
    (:domain trip_planning)
    (:objects
        prague vienna porto - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day ; d10 is a dummy day to mark the completion of day 9
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - num
    )
    (:init
        ; Initial location and day
        (current_location prague) ; The trip must start in Prague for the workshop on Day 1
        (current_day d1)

        ; Day progression for 9 active days (d1-d9) + 1 dummy end day (d10)
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10) ; Allows an action to consume d9 and reach the end state

        ; Number progression for stay counts
        (next_num n0 n1)
        (next_num n1 n2)
        (next_num n2 n3)
        (next_num n3 n4)
        (next_num n4 n5)
        (next_num n5 n6)
        (next_num n6 n7)
        (next_num n7 n8)
        (next_num n8 n9)

        ; City flight connectivity (bidirectional)
        (has_flight vienna porto)
        (has_flight porto vienna)
        (has_flight prague vienna)
        (has_flight vienna prague)

        ; Initial stay counts for each city
        (days_in_city prague n0)
        (days_in_city vienna n0)
        (days_in_city porto n0)
    )
    (:goal (and
        (current_day d10) ; The trip must complete by the end of day 9 (i.e., we are at the start of day 10)
        
        ; Prague constraints: Exactly 3 days, specifically covering Day 1 to Day 3 for the workshop
        (days_in_city prague n3)
        (visited_on_day prague d1)
        (visited_on_day prague d2)
        (visited_on_day prague d3)

        ; Vienna constraints: 3 days total (resolved from 9 total days - 3 Prague days = 6 remaining,
        ; allocated as 3 for Vienna and 3 for Porto to minimize deviation from requested 3 and 5)
        (days_in_city vienna n3)

        ; Porto constraints: 3 days total (as per resolution above)
        (days_in_city porto n3)
    ))
)