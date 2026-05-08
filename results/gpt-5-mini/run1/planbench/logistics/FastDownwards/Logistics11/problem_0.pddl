(define (problem logistics-instance-1)
  (:domain logistics-multiagent)

  (:objects
    ;; vehicles
    t1 t2 - truck
    p1 - plane

    ;; cargos
    c1 c2 - cargo

    ;; locations
    depot ap0 ap1 store - location

    ;; slots (discrete capacity)
    t1_s1 t1_s2 t2_s1 t2_s2 p1_s1 p1_s2 - slot

    ;; phases
    ph1 ph2 ph3 - phase
  )

  (:init
    ;; initial vehicle positions
    (at-veh t1 depot)
    (at-veh t2 ap1)
    (at-veh p1 ap0)

    ;; initial cargo positions (both at depot)
    (at-cargo c1 depot)
    (at-cargo c2 depot)

    ;; slot ownership and initial availability
    (slot-of t1_s1 t1)
    (slot-of t1_s2 t1)
    (slot-of t2_s1 t2)
    (slot-of t2_s2 t2)
    (slot-of p1_s1 p1)
    (slot-of p1_s2 p1)

    (slot-free t1_s1)
    (slot-free t1_s2)
    (slot-free t2_s1)
    (slot-free t2_s2)
    (slot-free p1_s1)
    (slot-free p1_s2)

    ;; connectivity (roads and air routes)
    (road depot ap0)
    (road ap0 depot)
    (road ap1 store)
    (road store ap1)

    (air-route ap0 ap1)

    ;; location types
    (airport ap0)
    (airport ap1)

    ;; phase ordering (next used only as informational; controller actions manipulate current-phase)
    (next ph1 ph2)
    (next ph2 ph3)

    ;; start in phase 1
    (current-phase ph1)
  )

  (:goal (and
    (at-cargo c1 store)
    (at-cargo c2 store)
    ;; enforce that the plan reached the final phase (ensures ordering)
    (current-phase ph3)
  ))
)