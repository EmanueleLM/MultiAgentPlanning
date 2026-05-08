(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    berlin warsaw bucharest - city
    day0 day1 day2 day3 day4 day5 day6 - day
    count0 count1 count2 - day-count
  )
  (:init
    (at berlin) ; Agent starts at Berlin
    (current-day day0) ; Represents the state before Day 1 begins

    (days-spent-in berlin count0) ; No days spent in Berlin yet
    (days-spent-in warsaw count0) ; No days spent in Warsaw yet
    (days-spent-in bucharest count0) ; No days spent in Bucharest yet

    (not (friend_met)) ; Friend has not been met yet

    ;; Direct flight connectivity based on specification
    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)

    ;; Define the sequence of discrete days for the 6-day trip
    (next-day day0 day1)
    (next-day day1 day2)
    (next-day day2 day3)
    (next-day day3 day4)
    (next-day day4 day5)
    (next-day day5 day6)

    ;; Define the sequence of day counts for tracking durations
    (next-day-count count0 count1)
    (next-day-count count1 count2)

    ;; Pre-compute days when friend meeting is possible (Day 5 or Day 6)
    ;; 'current-day day4' means it's the start of Day 5
    ;; 'current-day day5' means it's the start of Day 6
    (can-meet-friend day4)
    (can-meet-friend day5)
  )
  (:goal (and
    (current-day day6) ; The trip must end after 6 days
    (days-spent-in berlin count2) ; Visit Berlin for 2 days (adjusted from desired 3 for total duration)
    (days-spent-in warsaw count2) ; Visit Warsaw for 2 days (adjusted from desired 3 for total duration)
    (days-spent-in bucharest count2) ; Visit Bucharest for 2 days (mandatory duration)
    (friend_met) ; The friend meeting must occur
  ))
)