(define (problem travel-17days)
  (:domain multiagent-travel)

  ; -------------------------------------------------------------------
  ; Comments / Assumptions:
  ; - Days are discrete objects day1 .. day17 (total trip length is 17 days).
  ; - Only direct flights are allowed between cities. Public data lists direct flights:
  ;     Rome <-> Lyon and Zurich <-> Rome (both directions).
  ;   This is encoded by allowing only transitions that correspond to those direct connections:
  ;     allowed transitions: R->R, R->L, R->Z, L->L, L->R, Z->Z, Z->R.
  ;   Transitions L->Z and Z->L are intentionally not provided (no direct flight).
  ; - Agents require the following total stays (treated as hard constraints):
  ;     Rome: 6 days; Lyon: 6 days; Zurich: 7 days.
  ; - Wedding in Zurich must be attended on a day between day1 and day7 inclusive.
  ;   The domain provides early predicates for day1..day7 and assignment actions on those days
  ;   to set (wedding-attended).
  ; - The given hard constraints are inconsistent: required stays sum to 19 days (6+6+7),
  ;   but the total trip length is only 17 days. This problem is therefore unsatisfiable
  ;   under the strict reading of the inputs. The PDDL problem below faithfully encodes
  ;   the public and agent constraints as hard requirements; the planner will find no plan.
  ; -------------------------------------------------------------------

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)
    (unassigned day11) (unassigned day12) (unassigned day13) (unassigned day14) (unassigned day15)
    (unassigned day16) (unassigned day17)

    ; next relation linking consecutive days
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)
    (next day11 day12) (next day12 day13) (next day13 day14) (next day14 day15) (next day15 day16)
    (next day16 day17)

    ; starting day marker
    (start day1)

    ; early/late classification to encode wedding window
    (early day1) (early day2) (early day3) (early day4) (early day5) (early day6) (early day7)
    (late day8) (late day9) (late day10) (late day11) (late day12) (late day13) (late day14)
    (late day15) (late day16) (late day17)

    ; initial counts
    (= (rome-count) 0)
    (= (lyon-count) 0)
    (= (zurich-count) 0)
    ; wedding-attended initially false (not present)
  )

  ; Goal encodes the agents' hard constraints:
  ; - Each agent's required stay duration must be achieved exactly.
  ; - The wedding must be attended between days 1..7 (wedding-attended set).
  ; Note: Because 6+6+7 = 19 > 17, this goal set is infeasible. It is intentionally encoded
  ; exactly as a strict constraint set per the instructions.
  (:goal
    (and
      (= (rome-count) 6)
      (= (lyon-count) 6)
      (= (zurich-count) 7)
      (wedding-attended)
    )
  )
)