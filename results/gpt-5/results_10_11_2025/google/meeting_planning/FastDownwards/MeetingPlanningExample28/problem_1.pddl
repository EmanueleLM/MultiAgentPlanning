(define (problem meet-joshua-day-visit)
  (:domain sf-meet-joshua)
  (:objects
    visitor - agent
    joshua - person
    union_square chinatown - location
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ; Start at Union Square at 09:00 (540)
    (at visitor union_square)
    (time-at t540)

    ; Roads with 7-minute travel feasibility encoded via travel-slot instances
    (road union_square chinatown)
    (road chinatown union_square)

    ; Discrete ordering of the specific timeline for the audited plan
    (next t540 t1073)
    (next t1073 t1080)
    (next t1080 t1155)
    (next t1155 t1162)

    ; Waiting opportunity at Union Square until departure
    (wait-slot union_square t540 t1073)

    ; Travel slots (7-minute trips)
    (travel-slot union_square chinatown t1073 t1080)
    (travel-slot chinatown union_square t1155 t1162)

    ; Meeting slot: 75 minutes, entirely within Joshua's availability (18:00–21:30)
    (meet-slot joshua chinatown t1080 t1155)

    ; Availability marked at meeting start and end (both within 18:00–21:30)
    (available joshua chinatown t1080)
    (available joshua chinatown t1155)
  )

  (:goal
    (and
      (at visitor union_square)
      (time-at t1162)
      (met visitor joshua)
    )
  )
)