(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)

    (assigned ?d - day ?c - city)
    (day_assigned ?d - day)

    (current_day ?d - day)
    (last_city ?c - city)

    (planning_done)
    (met_friends)

    (brussels_count_0)
    (brussels_count_1)
    (brussels_count_2)

    (valencia_count_0)
    (valencia_count_1)
    (valencia_count_2)
    (valencia_count_3)

    (nice_count_0)
    (nice_count_1)
    (nice_count_2)
    (nice_count_3)
    (nice_count_4)
    (nice_count_5)
    (nice_count_6)
  )

  ;; first day assignments

  (:action assign_d1_brussels_from_start_b0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (brussels_count_0)
    )
    :effect (and
      (assigned d1 brussels)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city brussels)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action assign_d1_brussels_from_start_b1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (brussels_count_1)
    )
    :effect (and
      (assigned d1 brussels)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city brussels)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action assign_d1_valencia_from_start_v0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (valencia_count_0)
    )
    :effect (and
      (assigned d1 valencia)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city valencia)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action assign_d1_valencia_from_start_v1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (valencia_count_1)
    )
    :effect (and
      (assigned d1 valencia)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city valencia)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action assign_d1_valencia_from_start_v2
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (valencia_count_2)
    )
    :effect (and
      (assigned d1 valencia)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city valencia)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action assign_d1_nice_from_start_n0
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_0)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_0))
      (nice_count_1)
      (met_friends)
    )
  )

  (:action assign_d1_nice_from_start_n1
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_1)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_1))
      (nice_count_2)
      (met_friends)
    )
  )

  (:action assign_d1_nice_from_start_n2
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_2)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_2))
      (nice_count_3)
      (met_friends)
    )
  )

  (:action assign_d1_nice_from_start_n3
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_3)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_3))
      (nice_count_4)
      (met_friends)
    )
  )

  (:action assign_d1_nice_from_start_n4
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_4)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_4))
      (nice_count_5)
      (met_friends)
    )
  )

  (:action assign_d1_nice_from_start_n5
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (day_assigned d1))
      (nice_count_5)
    )
    :effect (and
      (assigned d1 nice)
      (day_assigned d1)
      (not (current_day d1))
      (current_day d2)
      (last_city nice)
      (not (nice_count_5))
      (nice_count_6)
      (met_friends)
    )
  )

  ;; day 2 assignments (window day)

  (:action assign_d2_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (brussels_count_0)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action assign_d2_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (brussels_count_1)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action assign_d2_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city valencia)
      (connected valencia brussels)
      (brussels_count_0)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city valencia))
      (last_city brussels)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action assign_d2_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city valencia)
      (connected valencia brussels)
      (brussels_count_1)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city valencia))
      (last_city brussels)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action assign_d2_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (connected nice brussels)
      (brussels_count_0)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city nice))
      (last_city brussels)
      (not (brussels_count_0))
      (brussels_count_1)
    )
  )

  (:action assign_d2_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (connected nice brussels)
      (brussels_count_1)
    )
    :effect (and
      (assigned d2 brussels)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city nice))
      (last_city brussels)
      (not (brussels_count_1))
      (brussels_count_2)
    )
  )

  (:action assign_d2_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city valencia)
      (valencia_count_0)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action assign_d2_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city valencia)
      (valencia_count_1)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action assign_d2_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city valencia)
      (valencia_count_2)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action assign_d2_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels valencia)
      (valencia_count_0)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city valencia)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action assign_d2_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels valencia)
      (valencia_count_1)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city valencia)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action assign_d2_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels valencia)
      (valencia_count_2)
    )
    :effect (and
      (assigned d2 valencia)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city valencia)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action assign_d2_nice_same_from_nice_n0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_0)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_0))
      (nice_count_1)
      (met_friends)
    )
  )

  (:action assign_d2_nice_same_from_nice_n1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_1)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_1))
      (nice_count_2)
      (met_friends)
    )
  )

  (:action assign_d2_nice_same_from_nice_n2
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_2)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_2))
      (nice_count_3)
      (met_friends)
    )
  )

  (:action assign_d2_nice_same_from_nice_n3
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_3)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_3))
      (nice_count_4)
      (met_friends)
    )
  )

  (:action assign_d2_nice_same_from_nice_n4
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_4)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_4))
      (nice_count_5)
      (met_friends)
    )
  )

  (:action assign_d2_nice_same_from_nice_n5
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city nice)
      (nice_count_5)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (nice_count_5))
      (nice_count_6)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_0)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_0))
      (nice_count_1)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_1)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_1))
      (nice_count_2)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_2)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_2))
      (nice_count_3)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_3)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_3))
      (nice_count_4)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_4)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_4))
      (nice_count_5)
      (met_friends)
    )
  )

  (:action assign_d2_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and
      (current_day d2)
      (not (day_assigned d2))
      (last_city brussels)
      (connected brussels nice)
      (nice_count_5)
    )
    :effect (and
      (assigned d2 nice)
      (day_assigned d2)
      (not (current_day d2))
      (current_day d3)
      (not (last_city brussels))
      (last_city nice)
      (not (nice_count_5))
      (nice_count_6)
      (met_friends)
    )
  )

  ;; day 3 assignments (window day)

  (:action assign_d3_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d3_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d3_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d3_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d3_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d3_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d3 brussels) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d3_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d3_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d3_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d3_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d3_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d3_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d3 valencia) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d3_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_0))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d3_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_1))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d3_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_2))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d3_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_3))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d3_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_4))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d3_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city nice) (nice_count_5))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d3_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d3) (not (day_assigned d3)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d3 nice) (day_assigned d3) (not (current_day d3)) (current_day d4) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  ;; day 4 assignments (window day)

  (:action assign_d4_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d4_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d4_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d4_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d4_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d4_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d4 brussels) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d4_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d4_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d4_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d4_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d4_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d4_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d4 valencia) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d4_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_0))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d4_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_1))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d4_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_2))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d4_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_3))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d4_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_4))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d4_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city nice) (nice_count_5))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d4_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d4) (not (day_assigned d4)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d4 nice) (day_assigned d4) (not (current_day d4)) (current_day d5) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  ;; day 5 assignments (window day)

  (:action assign_d5_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d5_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d5_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d5_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d5_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d5_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d5 brussels) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d5_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d5_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d5_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d5_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d5_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d5_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d5 valencia) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d5_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_0))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d5_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_1))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d5_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_2))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d5_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_3))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d5_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_4))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d5_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city nice) (nice_count_5))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d5_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d5) (not (day_assigned d5)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d5 nice) (day_assigned d5) (not (current_day d5)) (current_day d6) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  ;; day 6 assignments (window day)

  (:action assign_d6_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d6_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d6_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d6_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d6_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d6_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d6 brussels) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d6_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d6_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d6_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d6_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d6_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d6_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d6 valencia) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d6_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_0))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d6_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_1))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d6_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_2))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d6_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_3))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d6_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_4))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d6_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city nice) (nice_count_5))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5) (met_friends))
  )

  (:action assign_d6_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d6) (not (day_assigned d6)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d6 nice) (day_assigned d6) (not (current_day d6)) (current_day d7) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6) (met_friends))
  )

  ;; day 7 assignments (outside meeting window)

  (:action assign_d7_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d7_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d7_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d7_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d7_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d7_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d7 brussels) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d7_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d7_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d7_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d7_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d7_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d7_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d7 valencia) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d7_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_0))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_0)) (nice_count_1))
  )

  (:action assign_d7_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_1))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_1)) (nice_count_2))
  )

  (:action assign_d7_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_2))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_2)) (nice_count_3))
  )

  (:action assign_d7_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_3))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_3)) (nice_count_4))
  )

  (:action assign_d7_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_4))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_4)) (nice_count_5))
  )

  (:action assign_d7_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city nice) (nice_count_5))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (nice_count_5)) (nice_count_6))
  )

  (:action assign_d7_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1))
  )

  (:action assign_d7_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2))
  )

  (:action assign_d7_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3))
  )

  (:action assign_d7_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4))
  )

  (:action assign_d7_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5))
  )

  (:action assign_d7_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d7) (not (day_assigned d7)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d7 nice) (day_assigned d7) (not (current_day d7)) (current_day d8) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6))
  )

  ;; day 8 assignments (outside meeting window)

  (:action assign_d8_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d8_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d8_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d8_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d8_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1))
  )

  (:action assign_d8_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d8 brussels) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2))
  )

  (:action assign_d8_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d8_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d8_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d8_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1))
  )

  (:action assign_d8_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2))
  )

  (:action assign_d8_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d8 valencia) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3))
  )

  (:action assign_d8_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_0))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_0)) (nice_count_1))
  )

  (:action assign_d8_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_1))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_1)) (nice_count_2))
  )

  (:action assign_d8_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_2))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_2)) (nice_count_3))
  )

  (:action assign_d8_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_3))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_3)) (nice_count_4))
  )

  (:action assign_d8_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_4))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_4)) (nice_count_5))
  )

  (:action assign_d8_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city nice) (nice_count_5))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (nice_count_5)) (nice_count_6))
  )

  (:action assign_d8_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1))
  )

  (:action assign_d8_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2))
  )

  (:action assign_d8_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3))
  )

  (:action assign_d8_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4))
  )

  (:action assign_d8_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5))
  )

  (:action assign_d8_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d8) (not (day_assigned d8)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d8 nice) (day_assigned d8) (not (current_day d8)) (current_day d9) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6))
  )

  ;; day 9 terminal assignments

  (:action assign_d9_brussels_same_from_brussels_b0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (brussels_count_0))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (brussels_count_0)) (brussels_count_1) (planning_done))
  )

  (:action assign_d9_brussels_same_from_brussels_b1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (brussels_count_1))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (brussels_count_1)) (brussels_count_2) (planning_done))
  )

  (:action assign_d9_brussels_flight_from_valencia_b0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city valencia) (connected valencia brussels) (brussels_count_0))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (last_city valencia)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1) (planning_done))
  )

  (:action assign_d9_brussels_flight_from_valencia_b1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city valencia) (connected valencia brussels) (brussels_count_1))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (last_city valencia)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2) (planning_done))
  )

  (:action assign_d9_brussels_flight_from_nice_b0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (connected nice brussels) (brussels_count_0))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (last_city nice)) (last_city brussels) (not (brussels_count_0)) (brussels_count_1) (planning_done))
  )

  (:action assign_d9_brussels_flight_from_nice_b1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (connected nice brussels) (brussels_count_1))
    :effect (and (assigned d9 brussels) (day_assigned d9) (not (current_day d9)) (not (last_city nice)) (last_city brussels) (not (brussels_count_1)) (brussels_count_2) (planning_done))
  )

  (:action assign_d9_valencia_same_from_valencia_v0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city valencia) (valencia_count_0))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (valencia_count_0)) (valencia_count_1) (planning_done))
  )

  (:action assign_d9_valencia_same_from_valencia_v1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city valencia) (valencia_count_1))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (valencia_count_1)) (valencia_count_2) (planning_done))
  )

  (:action assign_d9_valencia_same_from_valencia_v2
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city valencia) (valencia_count_2))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (valencia_count_2)) (valencia_count_3) (planning_done))
  )

  (:action assign_d9_valencia_flight_from_brussels_v0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels valencia) (valencia_count_0))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city valencia) (not (valencia_count_0)) (valencia_count_1) (planning_done))
  )

  (:action assign_d9_valencia_flight_from_brussels_v1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels valencia) (valencia_count_1))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city valencia) (not (valencia_count_1)) (valencia_count_2) (planning_done))
  )

  (:action assign_d9_valencia_flight_from_brussels_v2
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels valencia) (valencia_count_2))
    :effect (and (assigned d9 valencia) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city valencia) (not (valencia_count_2)) (valencia_count_3) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_0))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_0)) (nice_count_1) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_1))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_1)) (nice_count_2) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n2
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_2))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_2)) (nice_count_3) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n3
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_3))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_3)) (nice_count_4) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n4
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_4))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_4)) (nice_count_5) (planning_done))
  )

  (:action assign_d9_nice_same_from_nice_n5
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city nice) (nice_count_5))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (nice_count_5)) (nice_count_6) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n0
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_0))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_0)) (nice_count_1) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n1
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_1))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_1)) (nice_count_2) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n2
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_2))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_2)) (nice_count_3) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n3
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_3))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_3)) (nice_count_4) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n4
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_4))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_4)) (nice_count_5) (planning_done))
  )

  (:action assign_d9_nice_flight_from_brussels_n5
    :parameters ()
    :precondition (and (current_day d9) (not (day_assigned d9)) (last_city brussels) (connected brussels nice) (nice_count_5))
    :effect (and (assigned d9 nice) (day_assigned d9) (not (current_day d9)) (not (last_city brussels)) (last_city nice) (not (nice_count_5)) (nice_count_6) (planning_done))
  )
)