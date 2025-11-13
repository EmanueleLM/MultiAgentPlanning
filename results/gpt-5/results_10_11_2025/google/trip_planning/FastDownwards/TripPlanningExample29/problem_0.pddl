(define (problem trip-krk-fra-dbv-10days)
  (:domain citytrip-10days)
  (:objects
    krk fra dbv - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    (current day1)
    (at dbv)
    (in day1 dbv)
    (assigned day1)

    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    (direct fra krk)
    (direct krk fra)
    (direct dbv fra)
    (direct fra dbv)

    (visited dbv)
  )
  (:goal (and
    (current day10)
    (at krk)

    (in day1 dbv)
    (in day2 dbv)
    (in day3 dbv)
    (in day4 dbv)
    (in day5 dbv)
    (in day6 dbv)
    (in day7 dbv)
    (in day8 fra)
    (in day9 krk)
    (in day10 krk)

    (visited dbv)
    (visited fra)
    (visited krk)
  ))
)