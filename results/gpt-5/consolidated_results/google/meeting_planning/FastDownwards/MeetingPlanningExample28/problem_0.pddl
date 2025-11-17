(define (problem schedule-joshua-feasible)
  (:domain meeting-schedule)
  (:objects
    mapper - agent
    joshua - person
    union_square chinatown - location
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ; arrival at Union Square at 09:00 (540)
    (at mapper union_square)
    (time-at t540)

    ; directed travel connectivity
    (road union_square chinatown)
    (road chinatown union_square)

    ; discrete ordered timeline consistent with the audited plan
    (next t540 t1073)
    (next t1073 t1080)
    (next t1080 t1155)
    (next t1155 t1162)

    ; waiting period at Union Square (540–1073)
    (wait-slot union_square t540 t1073)

    ; travel slots encoding 7-minute travel times
    (travel-slot union_square chinatown t1073 t1080)
    (travel-slot chinatown union_square t1155 t1162)

    ; Joshua availability and meeting slot at Chinatown for 75 minutes (1080–1155)
    (available joshua chinatown t1080)
    (available joshua chinatown t1155)
    (meet-slot joshua chinatown t1080 t1155)
  )

  (:goal
    (and
      (at mapper union_square)
      (time-at t1162)
      (met mapper joshua)
    )
  )
)