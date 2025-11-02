; Problem: travel-problem
; Notes:
; - Missing original inputs: the traveler's detailed itinerary (which cities to visit and required stay durations)
;   and the flight planner's full connectivity list were not provided by the user.
; - To make a consistent problem instance for FastDownwards I provide a minimal, explicit example:
;   * Cities: home, cityx, cityy, bucharest
;   * Days: d1 .. d12 (covers the requirement to meet between day 6 and day 11)
;   * Sample direct-flight facts are included below as an assumed connectivity set; the flight planner
;     action flightplanner-add-connection can add more connections at planning-time if desired.
; - Replace the objects and initial facts below with the true itinerary/connectivity to reflect actual inputs.

(define (problem travel-problem)
  (:domain travel-domain)

  (:objects
    traveler flightplanner - agent
    home cityx cityy bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ; initial agent locations
    (at traveler home)
    (at flightplanner home)

    ; mark which city object denotes Bucharest
    (bucharest bucharest)

    ; days: current day is d1
    (current-day d1)
    (next-day d1 d2)
    (next-day d2 d3)
    (next-day d3 d4)
    (next-day d4 d5)
    (next-day d5 d6)
    (next-day d6 d7)
    (next-day d7 d8)
    (next-day d8 d9)
    (next-day d9 d10)
    (next-day d10 d11)
    (next-day d11 d12)

    ; Allowed meeting days (strict constraint per user: meet friends in Bucharest between day 6 and day 11 inclusive)
    (allowed-meet-day d6)
    (allowed-meet-day d7)
    (allowed-meet-day d8)
    (allowed-meet-day d9)
    (allowed-meet-day d10)
    (allowed-meet-day d11)

    ; Sample connectivity facts (ASSUMED; replace with actual flight planner data if available)
    ; These edges give the traveler routes enabling a plan to reach Bucharest from home.
    (direct-flight home cityx)
    (direct-flight cityx bucharest)
    (direct-flight cityy bucharest)
    ; also include reverse flights for increased connectivity (assumption)
    (direct-flight cityx home)
    (direct-flight bucharest cityx)
    (direct-flight bucharest cityy)
  )

  ; Goal: ensure traveler meets friends in Bucharest between days 6 and 11 (met-friends true).
  (:goal (and
    (met-friends)
  ))
)