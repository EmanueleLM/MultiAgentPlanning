(define (problem meeting-planner-sf-prob-classical)
  (:domain meeting-planner-sf)
  (:objects
    bayview ggp - location
    barbara - person
    t540 t562 t572 t582 t592 t602 t612 t622 t632 t642 t652 - timepoint
    r0 r10 r20 r30 r40 r50 r60 r70 r80 r90 - needlevel
  )
  (:init
    (at bayview)
    (person_at barbara ggp)
    (at-time t540)

    (conn-22 bayview ggp)
    (conn-23 ggp bayview)

    (next-22 t540 t562)

    (next-10 t562 t572)
    (next-10 t572 t582)
    (next-10 t582 t592)
    (next-10 t592 t602)
    (next-10 t602 t612)
    (next-10 t612 t622)
    (next-10 t622 t632)
    (next-10 t632 t642)
    (next-10 t642 t652)

    (meet-start-ok barbara t562)
    (meet-start-ok barbara t572)
    (meet-start-ok barbara t582)
    (meet-start-ok barbara t592)
    (meet-start-ok barbara t602)
    (meet-start-ok barbara t612)
    (meet-start-ok barbara t622)
    (meet-start-ok barbara t632)
    (meet-start-ok barbara t642)

    (remaining barbara r90)
    (next-need r90 r80)
    (next-need r80 r70)
    (next-need r70 r60)
    (next-need r60 r50)
    (next-need r50 r40)
    (next-need r40 r30)
    (next-need r30 r20)
    (next-need r20 r10)
    (next-need r10 r0)

    (= (total-cost) 0)
  )
  (:goal
    (remaining barbara r0)
  )
  (:metric minimize (total-cost))
)