(define (problem visit_european_cities)
  (:domain city_visit)

  (:objects
    valencia split lyon - location
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - time
    annual_show - event
  )

  (:init
    (at valencia day1)
    (connected lyon split)
    (connected valencia lyon)

    (show_in_city annual_show split day10 day16)
    
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)
  )

  (:goal
    (and
      (at split day10)
      (at split day11)
      (at split day12)
      (at split day13)
      (at split day14)
      (at split day15)
      (at split day16)

      (exists (?d1 - time ?d2 - time ?d3 - time ?d4 - time ?d5 - time)
        (and (at valencia ?d1) (at valencia ?d2) (at valencia ?d3) (at valencia ?d4) (at valencia ?d5)
             (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?d5)
             ))
      
      (exists (?d1 - time ?d2 - time ?d3 - time ?d4 - time ?d5 - time ?d6 - time)
        (and (at lyon ?d1) (at lyon ?d2) (at lyon ?d3) (at lyon ?d4) (at lyon ?d5) (at lyon ?d6)
             (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4) (next ?d4 ?d5) (next ?d5 ?d6)
             ))
    )
  )
)