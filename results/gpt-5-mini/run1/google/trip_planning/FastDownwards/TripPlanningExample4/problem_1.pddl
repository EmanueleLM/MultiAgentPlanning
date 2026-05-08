(define (problem trip_planning_example4)
  (:domain direct_flight_itinerary)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    seville munich tallinn - city
  )
  (:init
    (suc day1 day2) (suc day2 day3) (suc day3 day4) (suc day4 day5)
    (suc day5 day6) (suc day6 day7) (suc day7 day8) (suc day8 day9)
    (suc day9 day10) (suc day10 day11) (suc day11 day12)

    (edge seville munich)
    (edge munich seville)
    (edge munich tallinn)
    (edge tallinn munich)

    (at day1 seville)
  )
  (:goal (and
    (at day1 seville)
    (at day2 seville)
    (at day3 seville)
    (at day4 seville)
    (at day5 seville)
    (at day6 seville)
    (at day7 seville)

    (at day8 munich)
    (at day9 munich)
    (at day10 munich)

    (at day11 tallinn)
    (at day12 tallinn)
  ))
)