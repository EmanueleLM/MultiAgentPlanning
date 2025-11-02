(define (problem trip-berlin-frankfurt-bucharest)
  (:domain trip-planning)

  (:objects
    traveler - person
    Berlin Frankfurt Bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Initial location: arrival in Berlin on day1 (Berlin planner constraint)
    (at traveler Berlin day1)

    ;; Next-day relations (discrete days 1..11)
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
  )

  ;; Goals encode the mandatory presence and stays:
  ;; - Must be in Berlin for days 1..7 inclusive to attend the Annual show (contiguous).
  ;; - Departure from Berlin no earlier than day 8 is ensured by requiring presence in Berlin through day7
  ;;   and presence elsewhere (Frankfurt) starting day8.
  ;; - Use only direct flights available; direct Berlin<->Frankfurt and Frankfurt<->Bucharest are possible.
  ;; The following goal picks a feasible allocation of the remaining days (8..11) to Frankfurt,
  ;; which satisfies the "direct connections" constraints and ensures a valid contiguous schedule.
  (:goal
    (and
      ;; Berlin event attendance: days 1-7
      (at traveler Berlin day1)
      (at traveler Berlin day2)
      (at traveler Berlin day3)
      (at traveler Berlin day4)
      (at traveler Berlin day5)
      (at traveler Berlin day6)
      (at traveler Berlin day7)

      ;; After the required Berlin stay, occupy Frankfurt for days 8-11 (4 days).
      ;; This choice uses the Frankfurt hub to continue/finish the trip and is consistent with
      ;; the available direct flights. (If an alternative including Bucharest is desired,
      ;; that can be obtained by replacing some Frankfurt-day goals with Bucharest-day goals,
      ;; but the Berlin attendance constraint remains fixed.)
      (at traveler Frankfurt day8)
      (at traveler Frankfurt day9)
      (at traveler Frankfurt day10)
      (at traveler Frankfurt day11)
    )
  )
)