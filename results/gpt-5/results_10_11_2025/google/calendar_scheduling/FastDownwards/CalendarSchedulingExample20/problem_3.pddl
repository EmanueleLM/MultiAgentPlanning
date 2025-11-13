(define (problem calendar_scheduling_example20_problem)
  (:domain calendar_scheduling_example20)
  (:objects
    ralph peter daniel - participant
    t1000_1030 - timeslot
  )
  (:init
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (all_available t1000_1030)
    (preferred t1000_1030)

    (unassigned ralph)
    (unassigned peter)
    (unassigned daniel)
  )
  (:goal (and
    (some_chosen)
    (not (unassigned ralph))
    (not (unassigned peter))
    (not (unassigned daniel))
  ))
)