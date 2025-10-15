(define (problem multi-agent-instance)
  (:domain multi-agent-template)
  (:objects
    ; Replace with concrete objects
    agA agB - agent
    loc1 loc2 - location
    t1 t2 - task
    ts1 ts2 ts3 - timeslot
    res1 res2 - resource
  )
  (:init
    ; initial agent positions
    (at agA loc1)
    (at agB loc2)

    ; tasks status (pending unless specified done)
    (task-pending t1)
    (task-pending t2)

    ; time slots availability: mark unavailable slots by omitting free-slot
    (free-slot ts1)
    (free-slot ts2)
    ; ts3 intentionally omitted if unavailable

    ; resources
    (resource-available res1)
    (resource-available res2)
  )
  (:goal
    (and
      ; Replace with combined goals
      (task-done t1)
      (task-done t2)
    )
  )
)