(define (problem trip_example_44)
  (:domain trip_planning)
  (:objects
    lyon zurich rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    (at zurich)
    (current_day d1)
    (city_count lyon n0)
    (city_count zurich n0)
    (city_count rome n0)

    ;; Temporal sequence
    (next_day_link d1 d2)
    (next_day_link d2 d3)
    (next_day_link d3 d4)
    (next_day_link d4 d5)
    (next_day_link d5 d6)
    (next_day_link d6 d7)
    (next_day_link d7 d8)
    (next_day_link d8 d9)
    (next_day_link d9 d10)
    (next_day_link d10 d11)
    (next_day_link d11 d12)
    (next_day_link d12 d13)
    (next_day_link d13 d14)
    (next_day_link d14 d15)
    (next_day_link d15 d16)
    (next_day_link d16 d17)

    ;; Count sequence
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)

    ;; Flight connectivity
    (flight rome lyon)
    (flight lyon rome)
    (flight zurich rome)
    (flight rome zurich)
  )
  (:goal (and
    ;; Total stay durations
    (city_count lyon n6)
    (city_count zurich n7)
    (city_count rome n6)

    ;; Wedding constraint in Zurich (Day 1-7)
    (visited zurich d1)
    (visited zurich d2)
    (visited zurich d3)
    (visited zurich d4)
    (visited zurich d5)
    (visited zurich d6)
    (visited zurich d7)
  ))
)