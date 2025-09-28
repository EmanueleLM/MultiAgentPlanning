(define (problem meet-emily-problem)
  (:domain meeting-domain)
  (:objects
    traveler emily - agent
    north-beach alamo-square - location
    t540 t556 t1170 t1185 t1186 t1201 t1245 t1260 - time
  )
  (:init
    (at traveler north-beach)
    (at emily alamo-square)
    (now t540)
    (= (total-meetings) 0)

    (can-travel north-beach alamo-square t540 t556)
    (can-travel north-beach alamo-square t1170 t1186)
    (can-travel north-beach alamo-square t1185 t1201)

    (can-travel alamo-square north-beach t1170 t1185)
    (can-travel alamo-square north-beach t1186 t1201)
    (can-travel alamo-square north-beach t1245 t1260)

    (time-adv t540 t556)
    (time-adv t540 t1170)
    (time-adv t540 t1185)
    (time-adv t540 t1186)
    (time-adv t540 t1201)
    (time-adv t540 t1245)
    (time-adv t540 t1260)

    (time-adv t556 t1170)
    (time-adv t556 t1185)
    (time-adv t556 t1186)
    (time-adv t556 t1201)
    (time-adv t556 t1245)
    (time-adv t556 t1260)

    (time-adv t1170 t1185)
    (time-adv t1170 t1186)
    (time-adv t1170 t1201)
    (time-adv t1170 t1245)
    (time-adv t1170 t1260)

    (time-adv t1185 t1186)
    (time-adv t1185 t1201)
    (time-adv t1185 t1245)
    (time-adv t1185 t1260)

    (time-adv t1186 t1201)
    (time-adv t1186 t1245)
    (time-adv t1186 t1260)

    (time-adv t1201 t1245)
    (time-adv t1201 t1260)

    (time-adv t1245 t1260)

    (can-meet t1170 t1185)
    (can-meet t1186 t1201)
    (can-meet t1245 t1260)
  )

  (:goal (met traveler emily))

  (:metric maximize (total-meetings))
)