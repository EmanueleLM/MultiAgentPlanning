(define (problem multiagent-trip-problem)
  (:domain multiagent-trip)

  (:objects
    traveler - person

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day

    used0 used1 used2 used3 used4 used5 used6 used7 used8 used9 used10 used11 - usedcnt

    b0 b1 b2 b3 b4 b5 b6 b7 - bcnt
    f0 f1 f2 f3 f4 - fcnt
    bu0 bu1 bu2 - bucnt
    s0 s1 s2 s3 s4 s5 s6 s7 - scnt
  )

  (:init
    (city berlin)
    (city frankfurt)
    (city bucharest)

    (direct-flight berlin frankfurt)
    (direct-flight frankfurt berlin)
    (direct-flight frankfurt bucharest)
    (direct-flight bucharest frankfurt)

    (at traveler berlin)
    (visited berlin)

    (current-day day1)
    (used used0)

    (berlin-days b0)
    (frankfurt-days f0)
    (bucharest-days bu0)
    (show-days s0)

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

    (next-used used0 used1)
    (next-used used1 used2)
    (next-used used2 used3)
    (next-used used3 used4)
    (next-used used4 used5)
    (next-used used5 used6)
    (next-used used6 used7)
    (next-used used7 used8)
    (next-used used8 used9)
    (next-used used9 used10)
    (next-used used10 used11)

    (next-berlin b0 b1)
    (next-berlin b1 b2)
    (next-berlin b2 b3)
    (next-berlin b3 b4)
    (next-berlin b4 b5)
    (next-berlin b5 b6)
    (next-berlin b6 b7)

    (next-frankfurt f0 f1)
    (next-frankfurt f1 f2)
    (next-frankfurt f2 f3)
    (next-frankfurt f3 f4)

    (next-bucharest bu0 bu1)
    (next-bucharest bu1 bu2)

    (next-show s0 s1)
    (next-show s1 s2)
    (next-show s2 s3)
    (next-show s3 s4)
    (next-show s4 s5)
    (next-show s5 s6)
    (next-show s6 s7)

    (show-period day1)
    (show-period day2)
    (show-period day3)
    (show-period day4)
    (show-period day5)
    (show-period day6)
    (show-period day7)

    (depart-berlin-allowed day8)
    (depart-berlin-allowed day9)
    (depart-berlin-allowed day10)
  )

  (:goal
    (and
      (visited berlin)
      (visited frankfurt)
      (visited bucharest)

      (berlin-days b7)
      (frankfurt-days f4)
      (bucharest-days bu2)
      (show-days s7)

      (used used11)
    )
  )
)