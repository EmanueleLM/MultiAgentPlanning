(define (problem integrated_schedule_problem_strips)
  (:domain integrated_scheduling_strips)
  (:objects
    ;; locations
    russian_hill golden_gate_park - location

    ;; person(s)
    john - person

    ;; candidate schedules
    s1 s2 - schedule

    ;; discrete time points used in the planning model
    t540 t561 t780 t870 t990 t1005 t1095 t1110 - time
  )

  (:init
    ;; Starting location and markers
    (at russian_hill)
    (at-user russian_hill)
    (at-john golden_gate_park)

    ;; current time = 09:00 = t540
    (now t540)

    ;; John's availability (precomputed times)
    (john-start t780)
    (john-end t1095)

    ;; successor relations for travel durations (precomputed)
    ;; travel from russian_hill to golden_gate_park advances by 21 minutes
    (succ21 t540 t561)

    ;; travel from golden_gate_park to russian_hill advances by 19 minutes
    ;; (not required by this scenario but provided for completeness)
    (succ19 t561 t582) ; unused but harmless
    (succ19 t780 t761) ; placeholder (unused)

    ;; ordering facts (precomputed relational arithmetic)
    (le t540 t561)
    (le t540 t780)
    (le t561 t780)
    (le t780 t870)
    (le t990 t1005)
    (le t1005 t1095)

    ;; schedule temporal facts (precomputed)
    ;; s1: start 13:00 (t780), duration 90 -> end t870 (feasible)
    (start-time s1 t780)
    (end-time s1 t870)
    (arrive-before s1)
    (fits-window s1)
    (min-duration s1)

    ;; s2: start 16:30 (t990), duration 120 -> end t1110 (infeasible vs John's end)
    (start-time s2 t990)
    (end-time s2 t1110)
    (arrive-before s2)
    (min-duration s2)
    ;; note: fits-window s2 is intentionally NOT added (so validation should fail for s2)

    ;; initial met state
    ; met is false initially, so nothing here

  )

  (:goal (and
    (met john)
    (valid s1)
    (not (valid s2))
  ))

  ;; Use action-costs for optimization. Meeting actions have negative cost to prefer meeting,
  ;; other actions have zero cost. Fast Downward will minimize total-cost; negative cost rewards meeting.
  (:metric minimize (total-cost))
)