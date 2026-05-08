(define (problem trip-problem)
  (:domain trip-domain)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Comments and assumptions:
  ; - Shared public constraints list requested stays: Oslo 3 days, Valencia 5 days,
  ;   Dublin 3 days, total trip horizon 9 days. These requirements sum to 11 days
  ;   (3 + 5 + 3), which is inconsistent with the 9-day trip horizon.
  ; - Per instructions, contradictory/over-subscribed stay requirements are flagged
  ;   rather than silently shortened. To produce a solvable planning instance we
  ;   make the minimal explicit assumption documented here:
  ;     ASSUMPTION: Valencia's stay is reduced from 5 to 3 days to respect the
  ;     global 9-day horizon. This is the minimal change (2 days) needed to
  ;     reconcile the per-city stay totals with the 9-day trip horizon.
  ; - Under this assumption, the earliest feasible schedule that honors:
  ;     * only direct flights (Oslo<->Dublin and Dublin<->Valencia),
  ;     * the specified stay durations (Oslo 3, Dublin 3, Valencia 3),
  ;     * relatives-visit window in Valencia between day5 and day9
  ;   is:
  ;     - Oslo:  day1, day2, day3
  ;     - Dublin: day4, day5, day6
  ;     - Valencia: day7, day8, day9
  ;   This ordering uses only direct flights Oslo->Dublin and Dublin->Valencia and
  ;   places Valencia within the relatives window (days 7-9 ⊆ [5,9]).
  ; - If you prefer a strict encoding that enforces the originally stated 5-day
  ;   Valencia stay, the problem is UNSAT (no valid plan) because 3+5+3 > 9.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; designate start day
    (start-day day1)

    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3)
    (unassigned day4) (unassigned day5) (unassigned day6)
    (unassigned day7) (unassigned day8) (unassigned day9)

    ;; temporal successor relations for the 9-day horizon
    (next day1 day2) (next day2 day3) (next day3 day4)
    (next day4 day5) (next day5 day6) (next day6 day7)
    (next day7 day8) (next day8 day9)

    ;; direct flight connectivity (only the explicitly listed edges)
    (direct oslo dublin) (direct dublin oslo)
    (direct dublin valencia) (direct valencia dublin)

    ;; Note: No direct Oslo <-> Valencia connection is provided (and none is fabricated).
  )

  (:goal
    (and
      ;; The chosen, earliest-feasible assignment under the stated assumption:
      ;; Oslo: day1..day3
      (assigned day1 oslo) (assigned day2 oslo) (assigned day3 oslo)
      ;; Dublin: day4..day6
      (assigned day4 dublin) (assigned day5 dublin) (assigned day6 dublin)
      ;; Valencia: day7..day9
      (assigned day7 valencia) (assigned day8 valencia) (assigned day9 valencia)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Note:
  ; - This problem encodes the earliest feasible schedule consistent with:
  ;     * the direct-flight-only constraint (Oslo -> Dublin -> Valencia),
  ;     * a reconciled per-city stay duration set (3,3,3) after making the
  ;     * documented assumption above to resolve the 11->9 over-subscription.
  ; - If you require a problem that enforces the original unmodified durations
  ;   (Oslo=3, Valencia=5, Dublin=3), that problem is logically inconsistent with
  ;   a 9-day horizon and will have no solution; this file does not encode that
  ;   unsatisfiable variant but it is left as a documented alternative.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)