; Problem template: fill in objects, flight facts, initial at, and per-city available-days.
; The example after the template is illustrative only. Replace with the real flight_graph
; and available-days you provide.

; Template structure (replace placeholder tokens and remove comments):
; (define (problem trip-11days)
;   (:domain travel-multiagent)
;   (:objects <agent-names> - agent <city-names> - city)
;   (:init
;     (= (total-days) 0)
;     ; flight connectivity facts: one (flight cityX cityY) fact per directed edge
;     (flight cityA cityB)
;     ...
;     ; initial location of each agent:
;     (at agent1 cityStart)
;     ; per-city available-days numeric initializers (must reflect real availability):
;     (= (available-days cityA) <num>)
;     ...
;     ; optionally mark starting city visited:
;     (visited cityStart)
;   )
;   (:goal (and
;     (visited <city1>) (visited <city2>) (visited <city3>) ; ensure all three are visited
;     (= (total-days) 11) ; total trip length must be exactly 11 days
;   ))
; )

; -------------------------
; Example problem (illustrative ONLY; do not treat these numbers as authoritative).
; Example uses three cities: cityA, cityB, cityC; agent: traveler.
; Example flight graph: cityA -> cityB, cityB -> cityC, cityA -> cityC (direct)
; Example available-days (invented for demonstration): cityA: 4, cityB: 4, cityC: 4
; The example enforces exactly 11 total days and requires visiting all three cities.

(define (problem trip-11days-example)
  (:domain travel-multiagent)
  (:objects
    traveler - agent
    cityA cityB cityC - city
  )
  (:init
    (= (total-days) 0)

    ; Flight connectivity (example)
    (flight cityA cityB)
    (flight cityB cityC)
    (flight cityA cityC)

    ; Initial agent location (starting in cityA)
    (at traveler cityA)

    ; Per-city available stay-days (example capacities)
    (= (available-days cityA) 4)
    (= (available-days cityB) 4)
    (= (available-days cityC) 4)

    ; Mark starting city visited
    (visited cityA)
  )

  (:goal (and
    (visited cityA)
    (visited cityB)
    (visited cityC)
    (= (total-days) 11)
  ))
)