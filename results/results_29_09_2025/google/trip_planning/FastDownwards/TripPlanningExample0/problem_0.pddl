; Problem: 14-day trip scheduling among Florence, Barcelona, Helsinki
; Notes and orchestration decisions (trade-offs documented here):
; - Agents requested total days = Florence 6 + Barcelona 5 + Helsinki 5 = 16 > available 14.
; - Mandatory constraint: meet friend in Florence sometime between day9 and day14 inclusive.
; - To honor the mandatory meeting window and approximate preferences, I allocate:
;     Florence: 6 days (days 9-14)    <- meets the meeting window exactly and preserves Florence's full 6-day request
;     Barcelona: 4 days  (days 1-2, 7-8) 
;     Helsinki: 4 days   (days 3-6)
;   This allocation reduces Barcelona and Helsinki requests by 1 day each (from 5->4), keeping Florence fully satisfied.
; - Starting location is not specified by inputs. To create a feasible schedule respecting direct-flight constraints
;   (Florence <-> Barcelona, Helsinki <-> Barcelona; no direct Florence<->Helsinki), I set the start to Barcelona on day1.
;   This choice is required to allow travel HEL <-> BCN transitions and to reach Florence by day9 via Barcelona.
; - Sequence rationale (feasible with only direct flights):
;     Day1-2: Barcelona
;     Fly BCN->HEL overnight (arrive day3)
;     Day3-6: Helsinki (4 days)
;     Fly HEL->BCN overnight (arrive day7)
;     Day7-8: Barcelona
;     Fly BCN->FLR overnight (arrive day9)
;     Day9-14: Florence (6 days, meeting occurs within day9..day14)
; - All preferences were treated as strong constraints; when infeasible in aggregate, Florence's meeting and full Florence duration were prioritized,
;   and Barcelona/Helinski were reduced equally to best approximate their requests.
; - The planner must use only direct flights encoded below via the (connected ...) facts.

(define (problem trip-14days)
  (:domain travel)
  (:objects
    florence barcelona helsinki - loc
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ; direct flight connections (public information)
    (connected barcelona florence)
    (connected florence barcelona)
    (connected helsinki barcelona)
    (connected barcelona helsinki)

    ; day succession relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ; initial location (choice documented above)
    (at barcelona day1)
  )

  ; Goal enforces exact allocation per day (this encodes the stay-duration constraints and the mandatory meeting window)
  ; Allocation summary:
  ;  - Barcelona: days 1,2,7,8  (4 days)
  ;  - Helsinki: days 3,4,5,6   (4 days)
  ;  - Florence: days 9,10,11,12,13,14 (6 days) -> meeting window satisfied (day9..day14)
  (:goal (and
    ;; Barcelona days 1-2
    (at barcelona day1)
    (at barcelona day2)

    ;; Helsinki days 3-6
    (at helsinki day3)
    (at helsinki day4)
    (at helsinki day5)
    (at helsinki day6)

    ;; Barcelona days 7-8
    (at barcelona day7)
    (at barcelona day8)

    ;; Florence days 9-14 (meeting window satisfied: at least one day in day9..day14; here fully occupied)
    (at florence day9)
    (at florence day10)
    (at florence day11)
    (at florence day12)
    (at florence day13)
    (at florence day14)
  ))
)