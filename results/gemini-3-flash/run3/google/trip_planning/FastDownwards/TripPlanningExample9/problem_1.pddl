(define (problem trip_planning_9)
  (:domain trip_planning_example_9)
  (:objects
    bucharest frankfurt stuttgart - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (at bucharest)
    (current_day d1)
    (stay_count bucharest c0)
    (stay_count frankfurt c0)
    (stay_count stuttgart c0)
    
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
    
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    
    (connected bucharest frankfurt)
    (connected frankfurt bucharest)
    (connected frankfurt stuttgart)
    (connected stuttgart frankfurt)
  )
  (:goal
    (and
      (current_day d11)
      (stay_count bucharest c3)
      (stay_count frankfurt c3)
      (stay_count stuttgart c6)
      (visited_on stuttgart d5)
      (visited_on stuttgart d6)
      (visited_on stuttgart d7)
      (visited_on stuttgart d8)
      (visited_on stuttgart d9)
      (visited_on stuttgart d10)
    )
  )
)