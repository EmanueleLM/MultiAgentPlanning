(define (problem multi-agent-delivery-problem)
  (:domain multi-agent-delivery)

  (:objects
    alice bob - agent

    depot siteA siteB - location

    package1 package2 - item

    t1 t2 t3 - timeslot
  )

  (:init
    (is-agent alice)
    (is-agent bob)

    (is-location depot)
    (is-location siteA)
    (is-location siteB)

    (is-item package1)
    (is-item package2)

    (is-timeslot t1)
    (is-timeslot t2)
    (is-timeslot t3)

    (next t1 t2)
    (next t2 t3)

    (current t1)

    (at alice depot)
    (at bob depot)

    (item-at package1 depot)
    (item-at package2 depot)
  )

  (:goal
    (and
      (delivered package1 siteA)
      (delivered package2 siteB)
      (inspected package1 siteA)
      (inspected package2 siteB)
      (at alice siteA)
      (at bob siteB)
      (current t3)
    )
  )
)