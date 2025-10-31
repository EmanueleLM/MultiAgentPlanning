(define (problem deliver-packages)
  (:domain multi_agent_transport)
  (:requirements :strips :typing :negative-preconditions)

  (:objects
    object_0 object_1 - agent
    object_6 object_7 object_8 object_9 object_10 - package
    object_11 object_12 - vehicle
    object_2 object_3 object_4 object_5 - location
    ; Declare locations and other entities under the general object type as needed
    ; (locations are typed above; agents, packages, vehicles already typed)
  )

  (:init
    ; Agents initial locations
    (at object_0 object_2)  ; agent object_0 at location object_2 (loc_A)
    (at object_1 object_4)  ; agent object_1 at location object_4 (loc_C)

    ; Vehicles initial locations
    (at object_11 object_2) ; vehicle object_11 at location object_2 (loc_A)
    (at object_12 object_4) ; vehicle object_12 at location object_4 (loc_C)

    ; Packages initial locations
    (at object_6 object_2)  ; package object_6 at location object_2 (pkg_1 at loc_A)
    (at object_7 object_3)  ; package object_7 at location object_3 (pkg_2 at loc_B)
    (at object_8 object_4)  ; package object_8 at location object_4 (pkg_3 at loc_C)
    (at object_9 object_4)  ; package object_9 at location object_4 (pkg_4 at loc_C)
    (at object_10 object_2) ; package object_10 at location object_2 (pkg_5 at loc_A)

    ; Agents are initially free (not holding anything)
    (free object_0)
    (free object_1)
  )

  (:goal
    (and
      ; Deliver package object_6 (pkg_1) to location object_5 (loc_D)
      (at object_6 object_5)
      ; Deliver package object_7 (pkg_2) to location object_5 (loc_D)
      (at object_7 object_5)
      ; Deliver package object_8 (pkg_3) to location object_3 (loc_B)
      (at object_8 object_3)
    )
  )
)