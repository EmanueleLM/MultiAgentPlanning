(define (problem meet_margaret_instance)
  (:domain meet_margaret_san_francisco)

  (:objects
    you - agent
    margaret - person
    union_square north_beach - location
    t0900am t0910am t0945pm t0952pm t1030pm - timepoint
  )

  (:init
    (at you union_square)
    (current_time t0900am)

    (connected union_square north_beach)
    (connected north_beach union_square)

    (available_to_meet margaret north_beach t0945pm t1030pm)

    (travel_link union_square north_beach t0900am t0910am)
    (travel_link north_beach union_square t0945pm t0952pm)

    (wait_link union_square t0900am t0945pm)
    (wait_link north_beach t0910am t0945pm)
    (wait_link north_beach t0945pm t1030pm)
    (wait_link union_square t0952pm t1030pm)
  )

  (:goal
    (and
      (met margaret)
      (current_time t1030pm)
      (at you north_beach)
    )
  )
)