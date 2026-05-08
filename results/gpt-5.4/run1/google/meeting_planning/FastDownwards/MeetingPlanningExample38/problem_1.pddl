(define (problem san_francisco_meet_margaret_instance)
  (:domain san_francisco_meet_margaret)

  (:objects
    union_square north_beach - location
    margaret - person
    t0900am t0910am t0945pm t1030pm - timepoint
  )

  (:init
    (at union_square)
    (current_time t0900am)
    (direct_route union_square north_beach t0900am t0910am)
    (next_time t0910am t0945pm)
    (available margaret t0945pm t1030pm)
  )

  (:goal
    (and
      (met margaret)
      (at north_beach)
      (current_time t1030pm)
    )
  )
)