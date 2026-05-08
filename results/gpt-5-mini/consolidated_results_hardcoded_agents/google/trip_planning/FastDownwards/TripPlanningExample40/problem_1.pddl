(define (problem tripplanningexample40)
  (:domain trip-planning)
  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    ;; direct flights (two-way where listed)
    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight manchester oslo)
    (flight oslo manchester)
    ;; day succession
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    ;; start: wedding constraint satisfied on day1 (manchester)
    (at day1 manchester)
  )
  (:goal (and
    ;; reconciled stays totaling 8 days:
    ;; manchester 2 days (day1-2), oslo 4 days (day3-6), reykjavik 2 days (day7-8)
    (at day1 manchester)
    (at day2 manchester)
    (at day3 oslo)
    (at day4 oslo)
    (at day5 oslo)
    (at day6 oslo)
    (at day7 reykjavik)
    (at day8 reykjavik)
  ))
)