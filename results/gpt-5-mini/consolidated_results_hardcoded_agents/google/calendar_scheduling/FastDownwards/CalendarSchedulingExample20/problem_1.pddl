(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t1000_1030 t1530_1600
    ralph peter daniel
  )
  (:init
    ;; availability (audited common_free)
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (available ralph t1530_1600)
    (available peter t1530_1600)
    (available daniel t1530_1600)

    ;; preferred slot as audited (before 13:30)
    (preferred t1000_1030)

    ;; no slot chosen initially: selected, chosen, assigned_any are absent
  )
  (:goal (and
    (selected)
    (assigned_any ralph)
    (assigned_any peter)
    (assigned_any daniel)
  ))
)