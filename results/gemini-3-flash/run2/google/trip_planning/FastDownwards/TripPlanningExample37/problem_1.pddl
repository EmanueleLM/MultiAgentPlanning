(define (problem trip_planning_example_37_prob)
  (:domain trip_planning_example_37)
  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - num
  )
  (:init
    ;; Successor relations for days
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    ;; Successor relations for counts
    (next_num n0 n1)
    (next_num n1 n2)
    (next_num n2 n3)
    (next_num n3 n4)
    (next_num n4 n5)
    (next_num n5 n6)
    (next_num n6 n7)
    (next_num n7 n8)
    (next_num n8 n9)
    (next_num n9 n10)

    ;; Flight network
    (flight reykjavik milan)
    (flight milan reykjavik)
    (flight milan porto)
    (flight porto milan)

    ;; Initial counts
    (visited_count reykjavik n0)
    (visited_count milan n0)
    (visited_count porto n0)
  )
  (:goal
    (and
      ;; Reach the end of the trip
      (current_day day_10)
      
      ;; Spend exactly the required number of days in each city
      ;; Note: Total required days (6+4+2=12) exceed trip length (10),
      ;; this is modeled faithfully to the prompt.
      (visited_count reykjavik n6)
      (visited_count milan n4)
      (visited_count porto n2)
      
      ;; Special event attendance requirement
      (at porto day_9)
      (at porto day_10)
    )
  )
)