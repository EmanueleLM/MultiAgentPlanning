(define (problem travel-plan)
  (:domain traveler)
  
  (:objects 
    London Bucharest Reykjavik - city
    hotel1London hotel1Bucharest hotel1Reykjavik - hotel
    traveler - person
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )
  
  (:init 
    (at traveler London)
    (connected London Bucharest)
    (connected Bucharest Reykjavik)
    (connected Reykjavik London)
    
    (day day1)
    (next-day day1 day2)
    (next-day day2 day3)
    (next-day day3 day4)
    (next-day day4 day5)
    (next-day day5 day6)
    (next-day day6 day7)
    (next-day day7 day8)
    (next-day day8 day9)
    (next-day day9 day10)
    (next-day day10 day11)
    (next-day day11 day12)
    (next-day day12 day13)
    (next-day day13 day14)

    (flight-available London Bucharest day4)
    (flight-available Bucharest Reykjavik day9)
    (flight-available Reykjavik London day14)

    (hotel-available hotel1London London day1)
    (hotel-available hotel1London London day2)
    (hotel-available hotel1London London day3)
    (hotel-available hotel1London London day4)
    (hotel-available hotel1Bucharest Bucharest day5)
    (hotel-available hotel1Bucharest Bucharest day6)
    (hotel-available hotel1Bucharest Bucharest day7)
    (hotel-available hotel1Bucharest Bucharest day8)
    (hotel-available hotel1Bucharest Bucharest day9)
    (hotel-available hotel1Reykjavik Reykjavik day10)
    (hotel-available hotel1Reykjavik Reykjavik day11)
    (hotel-available hotel1Reykjavik Reykjavik day12)
    (hotel-available hotel1Reykjavik Reykjavik day13)
    (hotel-available hotel1Reykjavik Reykjavik day14)

    (can-stay hotel1London day1 day4 traveler)
    (can-stay hotel1Bucharest day5 day9 traveler)
    (can-stay hotel1Reykjavik day10 day14 traveler)
  )
  
  (:goal 
    (and 
      (at traveler Reykjavik)
      (day day14)
    )
  )
)