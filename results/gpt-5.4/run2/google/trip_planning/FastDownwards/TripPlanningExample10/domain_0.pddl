(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (start_pending)
    (trip_complete)
    (visited_relatives)

    (occupied ?d - day ?c - city)

    (oslo_count_0)
    (oslo_count_1)
    (oslo_count_2)
    (oslo_count_3)

    (dublin_count_0)
    (dublin_count_1)
    (dublin_count_2)
    (dublin_count_3)

    (valencia_count_0)
    (valencia_count_1)
    (valencia_count_2)
    (valencia_count_3)
    (valencia_count_4)
    (valencia_count_5)
  )

  (:action choose_start_oslo
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at oslo)
      (not (start_pending))
    )
  )

  (:action choose_start_dublin
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at dublin)
      (not (start_pending))
    )
  )

  (:action choose_start_valencia
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at valencia)
      (not (start_pending))
    )
  )

  (:action stay_day_1_oslo
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_1)
      (next_day day_1 day_2)
      (oslo_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_1 oslo)
      (not (current_day day_1))
      (current_day day_2)
      (not (oslo_count_0))
      (oslo_count_1)
    )
  )

  (:action stay_day_1_dublin
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_1)
      (next_day day_1 day_2)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_1 dublin)
      (not (current_day day_1))
      (current_day day_2)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action stay_day_1_valencia
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_1)
      (next_day day_1 day_2)
      (valencia_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_1 valencia)
      (not (current_day day_1))
      (current_day day_2)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action fly_day_1_oslo_to_dublin
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_1)
      (next_day day_1 day_2)
      (direct_flight oslo dublin)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (occupied day_1 dublin)
      (not (current_day day_1))
      (current_day day_2)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action fly_day_1_dublin_to_oslo
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_1)
      (next_day day_1 day_2)
      (direct_flight dublin oslo)
      (oslo_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (occupied day_1 oslo)
      (not (current_day day_1))
      (current_day day_2)
      (not (oslo_count_0))
      (oslo_count_1)
    )
  )

  (:action fly_day_1_dublin_to_valencia
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_1)
      (next_day day_1 day_2)
      (direct_flight dublin valencia)
      (valencia_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_1 valencia)
      (not (current_day day_1))
      (current_day day_2)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action fly_day_1_valencia_to_dublin
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_1)
      (next_day day_1 day_2)
      (direct_flight valencia dublin)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (occupied day_1 dublin)
      (not (current_day day_1))
      (current_day day_2)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action stay_day_2_oslo
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (oslo_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_0))
      (oslo_count_1)
    )
  )

  (:action stay_day_2_oslo_from_1
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (oslo_count_1)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_1))
      (oslo_count_2)
    )
  )

  (:action stay_day_2_oslo_from_2
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (oslo_count_2)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_2))
      (oslo_count_3)
    )
  )

  (:action stay_day_2_dublin
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action stay_day_2_dublin_from_1
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (dublin_count_1)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_1))
      (dublin_count_2)
    )
  )

  (:action stay_day_2_dublin_from_2
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (dublin_count_2)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_2))
      (dublin_count_3)
    )
  )

  (:action stay_day_2_valencia
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (valencia_count_0)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action stay_day_2_valencia_from_1
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (valencia_count_1)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action stay_day_2_valencia_from_2
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (valencia_count_2)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action stay_day_2_valencia_from_3
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (valencia_count_3)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_3))
      (valencia_count_4)
    )
  )

  (:action stay_day_2_valencia_from_4
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (valencia_count_4)
      (not (start_pending))
    )
    :effect (and
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_4))
      (valencia_count_5)
    )
  )

  (:action fly_day_2_oslo_to_dublin
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight oslo dublin)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action fly_day_2_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight oslo dublin)
      (dublin_count_1)
      (not (start_pending))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_1))
      (dublin_count_2)
    )
  )

  (:action fly_day_2_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and
      (at oslo)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight oslo dublin)
      (dublin_count_2)
      (not (start_pending))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_2))
      (dublin_count_3)
    )
  )

  (:action fly_day_2_dublin_to_oslo
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin oslo)
      (oslo_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_0))
      (oslo_count_1)
    )
  )

  (:action fly_day_2_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin oslo)
      (oslo_count_1)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_1))
      (oslo_count_2)
    )
  )

  (:action fly_day_2_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin oslo)
      (oslo_count_2)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (occupied day_2 oslo)
      (not (current_day day_2))
      (current_day day_3)
      (not (oslo_count_2))
      (oslo_count_3)
    )
  )

  (:action fly_day_2_dublin_to_valencia
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin valencia)
      (valencia_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_0))
      (valencia_count_1)
    )
  )

  (:action fly_day_2_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin valencia)
      (valencia_count_1)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_1))
      (valencia_count_2)
    )
  )

  (:action fly_day_2_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin valencia)
      (valencia_count_2)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_2))
      (valencia_count_3)
    )
  )

  (:action fly_day_2_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin valencia)
      (valencia_count_3)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_3))
      (valencia_count_4)
    )
  )

  (:action fly_day_2_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and
      (at dublin)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight dublin valencia)
      (valencia_count_4)
      (not (start_pending))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (occupied day_2 valencia)
      (not (current_day day_2))
      (current_day day_3)
      (not (valencia_count_4))
      (valencia_count_5)
    )
  )

  (:action fly_day_2_valencia_to_dublin
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight valencia dublin)
      (dublin_count_0)
      (not (start_pending))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_0))
      (dublin_count_1)
    )
  )

  (:action fly_day_2_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight valencia dublin)
      (dublin_count_1)
      (not (start_pending))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_1))
      (dublin_count_2)
    )
  )

  (:action fly_day_2_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and
      (at valencia)
      (current_day day_2)
      (next_day day_2 day_3)
      (direct_flight valencia dublin)
      (dublin_count_2)
      (not (start_pending))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (occupied day_2 dublin)
      (not (current_day day_2))
      (current_day day_3)
      (not (dublin_count_2))
      (dublin_count_3)
    )
  )

  (:action stay_day_3_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_3_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_3_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_3_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_3_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_3_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_3_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_3_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_3_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_3_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_3_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_3_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_3_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_3_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_3) (next_day day_3 day_4) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_3_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_3_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_3_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_3 oslo) (not (current_day day_3)) (current_day day_4) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_3_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_3_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_3_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_3_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_3_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_3) (next_day day_3 day_4) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_3 valencia) (not (current_day day_3)) (current_day day_4) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_3_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_3_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_3_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_3) (next_day day_3 day_4) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_3 dublin) (not (current_day day_3)) (current_day day_4) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action stay_day_4_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_4_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_4_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_4_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_4_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_4_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_4_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_4_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_4_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_4_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_4_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_4_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_4_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_4_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_4) (next_day day_4 day_5) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_4_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_4_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_4_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_4 oslo) (not (current_day day_4)) (current_day day_5) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_4_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_4_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_4_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_4_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_4_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_4) (next_day day_4 day_5) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_4 valencia) (not (current_day day_4)) (current_day day_5) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_4_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_4_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_4_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_4) (next_day day_4 day_5) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_4 dublin) (not (current_day day_4)) (current_day day_5) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action stay_day_5_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_5_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_5_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_5_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_5_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_5_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_5_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_5_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_5_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_5_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_5_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_5_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_5_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_5_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_5) (next_day day_5 day_6) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_5_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_5_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_5_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_5 oslo) (not (current_day day_5)) (current_day day_6) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_5_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_5_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_5_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_5_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_5_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_5) (next_day day_5 day_6) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_5 valencia) (visited_relatives) (not (current_day day_5)) (current_day day_6) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_5_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_5_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_5_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_5) (next_day day_5 day_6) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_5 dublin) (not (current_day day_5)) (current_day day_6) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action stay_day_6_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_6_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_6_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_6_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_6_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_6_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_6_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_6_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_6_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_6_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_6_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_6_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_6_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_6_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_6) (next_day day_6 day_7) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_6_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_6_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_6_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_6 oslo) (not (current_day day_6)) (current_day day_7) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_6_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_6_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_6_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_6_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_6_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_6) (next_day day_6 day_7) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_6 valencia) (visited_relatives) (not (current_day day_6)) (current_day day_7) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_6_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_6_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_6_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_6) (next_day day_6 day_7) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_6 dublin) (not (current_day day_6)) (current_day day_7) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action stay_day_7_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_7_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_7_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_7_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_7_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_7_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_7_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_7_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_7_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_7_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_7_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_7_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_7_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_7_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_7) (next_day day_7 day_8) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_7_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_7_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_7_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_7 oslo) (not (current_day day_7)) (current_day day_8) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_7_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_7_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_7_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_7_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_7_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_7) (next_day day_7 day_8) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_7 valencia) (visited_relatives) (not (current_day day_7)) (current_day day_8) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_7_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_7_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_7_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_7) (next_day day_7 day_8) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_7 dublin) (not (current_day day_7)) (current_day day_8) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action stay_day_8_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action stay_day_8_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action stay_day_8_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action stay_day_8_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action stay_day_8_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action stay_day_8_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action stay_day_8_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action stay_day_8_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action stay_day_8_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action stay_day_8_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action stay_day_8_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_8_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_8_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_8_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_8) (next_day day_8 day_9) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action fly_day_8_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action fly_day_8_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action fly_day_8_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_8 oslo) (not (current_day day_8)) (current_day day_9) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action fly_day_8_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action fly_day_8_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action fly_day_8_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action fly_day_8_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action fly_day_8_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_8) (next_day day_8 day_9) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_8 valencia) (visited_relatives) (not (current_day day_8)) (current_day day_9) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action fly_day_8_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action fly_day_8_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action fly_day_8_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_8) (next_day day_8 day_9) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_8 dublin) (not (current_day day_8)) (current_day day_9) (not (dublin_count_2)) (dublin_count_3))
  )

  (:action finish_day_9_stay_oslo
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (oslo_count_0) (not (start_pending)))
    :effect (and (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action finish_day_9_stay_oslo_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (oslo_count_1) (not (start_pending)))
    :effect (and (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action finish_day_9_stay_oslo_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (oslo_count_2) (not (start_pending)))
    :effect (and (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action finish_day_9_stay_dublin
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (dublin_count_0) (not (start_pending)))
    :effect (and (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action finish_day_9_stay_dublin_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (dublin_count_1) (not (start_pending)))
    :effect (and (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action finish_day_9_stay_dublin_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (dublin_count_2) (not (start_pending)))
    :effect (and (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action finish_day_9_stay_valencia
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (valencia_count_0) (not (start_pending)))
    :effect (and (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action finish_day_9_stay_valencia_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (valencia_count_1) (not (start_pending)))
    :effect (and (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action finish_day_9_stay_valencia_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (valencia_count_2) (not (start_pending)))
    :effect (and (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action finish_day_9_stay_valencia_from_3
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (valencia_count_3) (not (start_pending)))
    :effect (and (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action finish_day_9_stay_valencia_from_4
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (valencia_count_4) (not (start_pending)))
    :effect (and (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action finish_day_9_fly_oslo_to_dublin
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (direct_flight oslo dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action finish_day_9_fly_oslo_to_dublin_from_1
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (direct_flight oslo dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action finish_day_9_fly_oslo_to_dublin_from_2
    :parameters ()
    :precondition (and (at oslo) (current_day day_9) (direct_flight oslo dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at oslo)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_2)) (dublin_count_3))
  )
  (:action finish_day_9_fly_dublin_to_oslo
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin oslo) (oslo_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_0)) (oslo_count_1))
  )
  (:action finish_day_9_fly_dublin_to_oslo_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin oslo) (oslo_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_1)) (oslo_count_2))
  )
  (:action finish_day_9_fly_dublin_to_oslo_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin oslo) (oslo_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at oslo) (occupied day_9 oslo) (trip_complete) (not (current_day day_9)) (not (oslo_count_2)) (oslo_count_3))
  )
  (:action finish_day_9_fly_dublin_to_valencia
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin valencia) (valencia_count_0) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_0)) (valencia_count_1))
  )
  (:action finish_day_9_fly_dublin_to_valencia_from_1
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin valencia) (valencia_count_1) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_1)) (valencia_count_2))
  )
  (:action finish_day_9_fly_dublin_to_valencia_from_2
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin valencia) (valencia_count_2) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_2)) (valencia_count_3))
  )
  (:action finish_day_9_fly_dublin_to_valencia_from_3
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin valencia) (valencia_count_3) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_3)) (valencia_count_4))
  )
  (:action finish_day_9_fly_dublin_to_valencia_from_4
    :parameters ()
    :precondition (and (at dublin) (current_day day_9) (direct_flight dublin valencia) (valencia_count_4) (not (start_pending)))
    :effect (and (not (at dublin)) (at valencia) (occupied day_9 valencia) (visited_relatives) (trip_complete) (not (current_day day_9)) (not (valencia_count_4)) (valencia_count_5))
  )
  (:action finish_day_9_fly_valencia_to_dublin
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (direct_flight valencia dublin) (dublin_count_0) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_0)) (dublin_count_1))
  )
  (:action finish_day_9_fly_valencia_to_dublin_from_1
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (direct_flight valencia dublin) (dublin_count_1) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_1)) (dublin_count_2))
  )
  (:action finish_day_9_fly_valencia_to_dublin_from_2
    :parameters ()
    :precondition (and (at valencia) (current_day day_9) (direct_flight valencia dublin) (dublin_count_2) (not (start_pending)))
    :effect (and (not (at valencia)) (at dublin) (occupied day_9 dublin) (trip_complete) (not (current_day day_9)) (not (dublin_count_2)) (dublin_count_3))
  )
)