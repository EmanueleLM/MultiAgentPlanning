(define (problem IntegratedTravelItinerary)
  (:domain IntegratedTravelPlanning)
  
  (:objects
    Barcelona Florence Helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    number1 number2 number3 number4 number5 number6 number7 number8 number9 number10 number11 number12 number13 number14 - number
  )
  
  (:init 
    (at Barcelona)
    (flight-available Barcelona Florence)
    (flight-available Helsinki Barcelona)
    (travel-day number1)
    (travel-day number7)
    (travel-day number8)
  )
  
  (:goal
    (and
      (visited Barcelona)
      (visited Florence)
      (visited Helsinki)
      (days-planned Barcelona day5)
      (days-planned Helsinki day5)
    )
  )
)