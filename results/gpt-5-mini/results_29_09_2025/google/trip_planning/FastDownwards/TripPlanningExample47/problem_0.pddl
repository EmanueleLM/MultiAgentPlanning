(define (problem travel-problem)
  (:domain travel-domain)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  ;; Initial state:
  ;; - Paris is fixed on day1 and day2 (conference days 1 & 2).
  ;; - Days 3..7 are free and will be assigned by actions that either stay in the same city
  ;;   or use a flight action. Only flight actions present are those with known direct flights.
  (:init
    (assigned paris day1)
    (assigned paris day2)
    (day-free day3)
    (day-free day4)
    (day-free day5)
    (day-free day6)
    (day-free day7)
  )

  ;; Goal: a full 7-day assignment that respects:
  ;; - Paris on days 1 & 2 (conference hard constraint)
  ;; - Istanbul occupies days 3 & 4 (Istanbul agent hard preference satisfied earliest possible)
  ;; - Salzburg occupies days 5..7 (remaining days)
  (:goal (and
    (assigned paris day1)
    (assigned paris day2)
    (assigned istanbul day3)
    (assigned istanbul day4)
    (assigned salzburg day5)
    (assigned salzburg day6)
    (assigned salzburg day7)
  ))
)