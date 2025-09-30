(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    paris istanbul salzburg - city
    d1 d2 d3 d4 d5 d6 d7 - day
  )

  ; Initial state: conference requires day1 in Paris (hard constraint) -> set day1 assigned at Paris.
  (:init
    (at paris d1)
    (day-assigned d1)
  )

  ; Goal: 7-day itinerary assignment that respects direct-flight connectivity and agent constraints resolved into a feasible plan:
  ; - Paris: days 1-2 (conference days 1 & 2)
  ; - Istanbul: days 3-4 (Istanbul agent requested 2 days; honored)
  ; - Salzburg: days 5-7 (Salzburg requested 5 days but global 7-day limit makes 5 impossible together with others;
  ;   the plan uses 3 days in Salzburg as a feasible alternative)
  (:goal
    (and
      (at paris d1)
      (at paris d2)
      (at istanbul d3)
      (at istanbul d4)
      (at salzburg d5)
      (at salzburg d6)
      (at salzburg d7)
    )
  )
)