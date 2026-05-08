(define (problem travel-problem-dbv-vce-11days)
  (:domain travel-domain)
  (:objects
    DBV VCE IST - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Temporal successor (contiguous days)
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

    ;; Provided direct-flight legs (only the listed legs are available)
    (direct DBV VCE)
    (direct DBV IST)

    ;; Start location and first-day occupancy:
    ;; Enforce start in Dubrovnik (DBV) on day1 as a strict constraint.
    (at DBV day1)
    (occupied day1)

    ;; No other (at ...) / (occupied ...) facts are true initially;
    ;; subsequent days must be assigned by stay or fly actions.
  )

  ;; Goal: enforce corrected allocation consistent with strict directed-flight interpretation
  ;; (We adopt the auditor's minimal-feasible strict-direction correction A1:
  ;;  keep Dubrovnik = 4 days, Venice = 7 days, use only provided direct leg DBV -> VCE.)
  ;; This is encoded as hard constraints: specified city for each day (contiguity required
  ;; by the action preconditions and next links in the domain).
  (:goal (and
    ;; Dubrovnik occupied for days 1-4 (4 days)
    (at DBV day1)
    (at DBV day2)
    (at DBV day3)
    (at DBV day4)

    ;; Venice occupied for days 5-11 (7 days)
    (at VCE day5)
    (at VCE day6)
    (at VCE day7)
    (at VCE day8)
    (at VCE day9)
    (at VCE day10)
    (at VCE day11)
  ))