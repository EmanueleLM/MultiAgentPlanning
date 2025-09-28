(define (problem trip-problem)
  (:domain trip-planning)
  (:objects
    Split Manchester Geneva - city
    day1 day2 day3 day4 - day
    pref-split-12 pref-split-13 pref-split-14 pref-split-23 pref-split-24 pref-split-34
    pref-man-12 pref-man-13 pref-man-14 pref-man-23 pref-man-24 pref-man-34
    pref-geneva-12 pref-geneva-13 pref-geneva-14 pref-geneva-23 pref-geneva-24 pref-geneva-34
    - preference
  )
  (:init
    (free-day day1) (free-day day2) (free-day day3) (free-day day4)
    (next day1 day2) (next day2 day3) (next day3 day4)
    (direct Split Geneva) (direct Geneva Split)
    (direct Manchester Split) (direct Split Manchester)
    (direct Manchester Geneva) (direct Geneva Manchester)
    (first-day day1)
    (pref-target pref-split-12 Split day1 day2)
    (pref-target pref-split-13 Split day1 day3)
    (pref-target pref-split-14 Split day1 day4)
    (pref-target pref-split-23 Split day2 day3)
    (pref-target pref-split-24 Split day2 day4)
    (pref-target pref-split-34 Split day3 day4)
    (pref-target pref-man-12 Manchester day1 day2)
    (pref-target pref-man-13 Manchester day1 day3)
    (pref-target pref-man-14 Manchester day1 day4)
    (pref-target pref-man-23 Manchester day2 day3)
    (pref-target pref-man-24 Manchester day2 day4)
    (pref-target pref-man-34 Manchester day3 day4)
    (pref-target pref-geneva-12 Geneva day1 day2)
    (pref-target pref-geneva-13 Geneva day1 day3)
    (pref-target pref-geneva-14 Geneva day1 day4)
    (pref-target pref-geneva-23 Geneva day2 day3)
    (pref-target pref-geneva-24 Geneva day2 day4)
    (pref-target pref-geneva-34 Geneva day3 day4)
  )
  (:goal (and
    (not (free-day day1)) (not (free-day day2)) (not (free-day day3)) (not (free-day day4))
    (at Split day2) (at Split day3)
    (pref-sat pref-split-12) (pref-sat pref-split-13) (pref-sat pref-split-14)
    (pref-sat pref-split-23) (pref-sat pref-split-24) (pref-sat pref-split-34)
    (pref-sat pref-man-12) (pref-sat pref-man-13) (pref-sat pref-man-14)
    (pref-sat pref-man-23) (pref-sat pref-man-24) (pref-sat pref-man-34)
    (pref-sat pref-geneva-12) (pref-sat pref-geneva-13) (pref-sat pref-geneva-14)
    (pref-sat pref-geneva-23) (pref-sat pref-geneva-24) (pref-sat pref-geneva-34)
  ))
)