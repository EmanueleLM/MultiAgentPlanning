(define (problem calendar_scheduling_example20_problem)
  (:domain calendar_scheduling_example20)
  (:objects
    ralph peter daniel - participant
    t1000_1030 t1530_1600 - timeslot
    s_select s_assign s_done - stage
  )
  (:init
    ; availability within Monday 09:00-17:00 UTC
    (available ralph t1000_1030)
    (available ralph t1530_1600)
    (available peter t1000_1030)
    (available peter t1530_1600)
    (available daniel t1000_1030)
    (available daniel t1530_1600)

    ; common free slots across all participants
    (common t1000_1030)
    (common t1530_1600)

    ; preferred slot (soft)
    (preferred t1000_1030)

    ; role mapping
    (role_ralph ralph)
    (role_peter peter)
    (role_daniel daniel)

    ; participants start unassigned
    (unassigned ralph)
    (unassigned peter)
    (unassigned daniel)

    ; stage ordering and initial stage
    (atstage s_select)
    (next s_select s_assign)
    (next s_assign s_done)

    ; selection initially open
    (selection_open)
  )
  (:goal
    (atstage s_done)
  )
)