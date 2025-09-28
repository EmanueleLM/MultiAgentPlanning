(define (problem trip-11days)
  (:domain travel-multiagent)
  (:objects
    traveler1 traveler2 traveler3 - agent
    dubrovnik venice istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    v1 v2 v3 v4 v5 v6 - stayslot
    d1 d2 d3 d4 - stayslot
    i1 - stayslot
  )
  (:init
    (at traveler1 dubrovnik)
    (at traveler2 venice)
    (at traveler3 istanbul)

    (flight dubrovnik venice)
    (flight dubrovnik istanbul)

    (slot-of v1 venice)
    (slot-of v2 venice)
    (slot-of v3 venice)
    (slot-of v4 venice)
    (slot-of v5 venice)
    (slot-of v6 venice)

    (slot-of d1 dubrovnik)
    (slot-of d2 dubrovnik)
    (slot-of d3 dubrovnik)
    (slot-of d4 dubrovnik)

    (slot-of i1 istanbul)

    (slot-free v1)
    (slot-free v2)
    (slot-free v3)
    (slot-free v4)
    (slot-free v5)
    (slot-free v6)
    (slot-free d1)
    (slot-free d2)
    (slot-free d3)
    (slot-free d4)
    (slot-free i1)
  )

  (:goal (and
    (visited dubrovnik)
    (visited venice)
    (visited istanbul)
    (day-used day1)
    (day-used day2)
    (day-used day3)
    (day-used day4)
    (day-used day5)
    (day-used day6)
    (day-used day7)
    (day-used day8)
    (day-used day9)
    (day-used day10)
    (day-used day11)
  ))
)