(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    traveler - agent
    dubrovnik istanbul venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - daytoken
    need_d1 need_d2 need_d3 need_d4 need_i1 need_i2 need_v1 need_v2 need_v3 need_v4 need_v5 - needtoken
  )

  (:init
    (at traveler dubrovnik)

    (direct-flight dubrovnik istanbul)
    (direct-flight dubrovnik venice)
    (direct-flight istanbul venice)

    (unallocated day1)
    (unallocated day2)
    (unallocated day3)
    (unallocated day4)
    (unallocated day5)
    (unallocated day6)
    (unallocated day7)
    (unallocated day8)
    (unallocated day9)
    (unallocated day10)
    (unallocated day11)

    (need need_d1 dubrovnik)
    (need need_d2 dubrovnik)
    (need need_d3 dubrovnik)
    (need need_d4 dubrovnik)

    (need need_i1 istanbul)
    (need need_i2 istanbul)

    (need need_v1 venice)
    (need need_v2 venice)
    (need need_v3 venice)
    (need need_v4 venice)
    (need need_v5 venice)
  )

  (:goal
    (and
      (visited dubrovnik)
      (visited istanbul)
      (visited venice)

      (used day1)
      (used day2)
      (used day3)
      (used day4)
      (used day5)
      (used day6)
      (used day7)
      (used day8)
      (used day9)
      (used day10)
      (used day11)

      (satisfied need_d1)
      (satisfied need_d2)
      (satisfied need_d3)
      (satisfied need_d4)

      (satisfied need_i1)
      (satisfied need_i2)

      (satisfied need_v1)
      (satisfied need_v2)
      (satisfied need_v3)
      (satisfied need_v4)
      (satisfied need_v5)
    )
  )
)