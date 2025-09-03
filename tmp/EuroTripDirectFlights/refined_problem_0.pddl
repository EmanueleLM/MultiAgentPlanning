(define (problem IntegratedTravelItinerary)
  (:domain IntegratedTravelPlanning)
  
  (:objects
    Barcelona Florence Helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )
  
  (:init 
    (at Barcelona)
    (flight-available Barcelona Florence)
    (flight-available Florence Barcelona)
    (flight-available Helsinki Barcelona)
    (flight-available Barcelona Helsinki)
    (days-remaining day1)
    (increased-day day1 day2)
    (increased-day day2 day3)
    (increased-day day3 day4)
    (increased-day day4 day5)
    (increased-day day5 day6)
    (increased-day day6 day7)
    (increased-day day7 day8)
    (increased-day day8 day9)
    (increased-day day9 day10)
    (increased-day day10 day11)
    (increased-day day11 day12)
    (increased-day day12 day13)
    (increased-day day13 day14)
  )
  
  (:goal
    (and
      (visited Barcelona)
      (visited Florence)
      (visited Helsinki)
      (days-planned Florence day6)
      (days-planned Barcelona day5)
      (days-planned Helsinki day5)
    )
  )
)