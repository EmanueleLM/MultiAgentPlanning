(define (problem meet-matthew-day-classical)
  (:domain multi-agent-scheduling-classical)

  (:objects
    traveler - agent
    matthew - person
    alamo sunset - location
    t540 t556 t810 t825 t870 - time
  )

  (:init
    (at-agent traveler alamo)
    (current-time t540)
    (can-travel alamo sunset t540 t556)
    (can-wait t556 t810)
    (can-meet matthew sunset t810 t825)
  )

  (:goal (and (met matthew)))

  (:metric minimize (total-cost))
)