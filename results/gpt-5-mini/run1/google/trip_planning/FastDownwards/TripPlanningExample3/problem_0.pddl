(define (problem trip-ber-waw-buc-6days)
  (:domain trip-planning)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ; day objects
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6)

    ; successor (explicit contiguous ordering enforced)
    (day-succ d1 d2)
    (day-succ d2 d3)
    (day-succ d3 d4)
    (day-succ d4 d5)
    (day-succ d5 d6)

    ; flight connectivity (undirected modeled by both directions)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ; initial assignment: trip starts in Berlin on Day 1 (assumption from proposal)
    (assigned d1)
    (in berlin d1)
  )

  ; Goals encode the recommended balanced itinerary as hard constraints,
  ; the auditor's requirement for full-day presence in Bucharest on days 5 and 6,
  ; and enforce the required day-by-day city allocation.
  (:goal
    (and
      ; Berlin full days 1-2
      (in berlin d1)
      (in berlin d2)

      ; Warsaw full days 3-4
      (in warsaw d3)
      (in warsaw d4)

      ; Bucharest full days 5-6 (meeting constraint between day 5 and day 6)
      (in bucharest d5)
      (in bucharest d6)
    )
  )
)