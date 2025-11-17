(define (problem calendar_scheduling_example20_problem)
  (:domain calendar_scheduling_example20)
  (:objects
    ralph peter daniel - participant
    t1000_1030 - timeslot
    s_select s_assign_ralph s_assign_peter s_assign_daniel s_done - stage
  )
  (:init
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (common t1000_1030)
    (preferred t1000_1030)

    (role_ralph ralph)
    (role_peter peter)
    (role_daniel daniel)

    (atstage s_select)
    (next s_select s_assign_ralph)
    (next s_assign_ralph s_assign_peter)
    (next s_assign_peter s_assign_daniel)
    (next s_assign_daniel s_done)
  )
  (:goal
    (atstage s_done)
  )
)