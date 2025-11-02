; Problem: 13-day trip visiting Florence, Amsterdam, Riga
; Assumptions and design notes:
; - Start day is d1 and the traveler starts in Florence on d1 to satisfy the Florence workshop constraint.
; - Chosen schedule (reconciled): Florence d1-d4, Amsterdam d5-d10, Riga d11-d13.
; - Flights are taken on the day before the first day in the destination city:
;   - Flight Florence->Amsterdam on d4 to be in Amsterdam on d5.
;   - Flight Amsterdam->Riga on d10 to be in Riga on d11.
(define (problem trip-plan)
  (:domain trip)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    ; starting location: earliest feasible to satisfy Florence workshop
    (at florence d1)

    ; direct flight connections (bidirectional where present)
    (connected florence amsterdam)
    (connected amsterdam florence)
    (connected amsterdam riga)
    (connected riga amsterdam)

    ; day succession
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
  )

  ; Goal encodes the reconciled itinerary:
  ; Florence days 1-4, Amsterdam days 5-10 (6 days), Riga days 11-13 (3 days) = 13 total
  (:goal (and
    ; Florence d1-d4 (4 days) -- workshop satisfied within d1..d4
    (at florence d1)
    (at florence d2)
    (at florence d3)
    (at florence d4)

    ; Amsterdam d5-d10 (6 days)
    (at amsterdam d5)
    (at amsterdam d6)
    (at amsterdam d7)
    (at amsterdam d8)
    (at amsterdam d9)
    (at amsterdam d10)

    ; Riga d11-d13 (3 days)
    (at riga d11)
    (at riga d12)
    (at riga d13)
  ))
)