(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (spent_prague ?d - day)
    (spent_vienna ?d - day)
    (spent_porto ?d - day)

    (prague_count_1)
    (prague_count_2)
    (prague_count_3)

    (vienna_count_1)
    (vienna_count_2)
    (vienna_count_3)

    (porto_count_1)
    (porto_count_2)
    (porto_count_3)
    (porto_count_4)
    (porto_count_5)

    (workshop_attended)

    (start_prague)
    (start_vienna)
    (start_porto)
  )

  ;; choose exactly one initial city at day d1
  (:action choose_start_prague
    :precondition (and
      (not (start_prague))
      (not (start_vienna))
      (not (start_porto)))
    :effect (and
      (start_prague)
      (at prague d1))
  )

  (:action choose_start_vienna
    :precondition (and
      (not (start_prague))
      (not (start_vienna))
      (not (start_porto)))
    :effect (and
      (start_vienna)
      (at vienna d1))
  )

  (:action choose_start_porto
    :precondition (and
      (not (start_prague))
      (not (start_vienna))
      (not (start_porto)))
    :effect (and
      (start_porto)
      (at porto d1))
  )

  ;; prague spend variants, count frontiers 0,1,2 only; no actions after count_3
  (:action stay_prague_window_c0
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at prague d2)
      (spent_prague d1)
      (prague_count_1)
      (workshop_attended))
  )

  (:action stay_prague_window_c1
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at prague d2)
      (spent_prague d1)
      (prague_count_2)
      (workshop_attended))
  )

  (:action stay_prague_window_c2
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at prague d2)
      (spent_prague d1)
      (prague_count_3)
      (workshop_attended))
  )

  (:action stay_prague_window_c0_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at prague d3)
      (spent_prague d2)
      (prague_count_1)
      (workshop_attended))
  )

  (:action stay_prague_window_c1_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at prague d3)
      (spent_prague d2)
      (prague_count_2)
      (workshop_attended))
  )

  (:action stay_prague_window_c2_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at prague d3)
      (spent_prague d2)
      (prague_count_3)
      (workshop_attended))
  )

  (:action stay_prague_window_c0_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at prague d4)
      (spent_prague d3)
      (prague_count_1)
      (workshop_attended))
  )

  (:action stay_prague_window_c1_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at prague d4)
      (spent_prague d3)
      (prague_count_2)
      (workshop_attended))
  )

  (:action stay_prague_window_c2_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at prague d4)
      (spent_prague d3)
      (prague_count_3)
      (workshop_attended))
  )

  (:action stay_prague_nonwindow_c0_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at prague d5)
      (spent_prague d4)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at prague d5)
      (spent_prague d4)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at prague d5)
      (spent_prague d4)
      (prague_count_3))
  )

  (:action stay_prague_nonwindow_c0_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at prague d6)
      (spent_prague d5)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at prague d6)
      (spent_prague d5)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at prague d6)
      (spent_prague d5)
      (prague_count_3))
  )

  (:action stay_prague_nonwindow_c0_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at prague d7)
      (spent_prague d6)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at prague d7)
      (spent_prague d6)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at prague d7)
      (spent_prague d6)
      (prague_count_3))
  )

  (:action stay_prague_nonwindow_c0_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at prague d8)
      (spent_prague d7)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at prague d8)
      (spent_prague d7)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at prague d8)
      (spent_prague d7)
      (prague_count_3))
  )

  (:action stay_prague_nonwindow_c0_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at prague d9)
      (spent_prague d8)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at prague d9)
      (spent_prague d8)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at prague d9)
      (spent_prague d8)
      (prague_count_3))
  )

  (:action stay_prague_nonwindow_c0_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at prague d10)
      (spent_prague d9)
      (prague_count_1))
  )

  (:action stay_prague_nonwindow_c1_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at prague d10)
      (spent_prague d9)
      (prague_count_2))
  )

  (:action stay_prague_nonwindow_c2_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at prague d10)
      (spent_prague d9)
      (prague_count_3))
  )

  ;; vienna spend variants
  (:action stay_vienna_c0_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at vienna d2)
      (spent_vienna d1)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at vienna d2)
      (spent_vienna d1)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at vienna d2)
      (spent_vienna d1)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at vienna d3)
      (spent_vienna d2)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at vienna d3)
      (spent_vienna d2)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at vienna d3)
      (spent_vienna d2)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at vienna d4)
      (spent_vienna d3)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at vienna d4)
      (spent_vienna d3)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at vienna d4)
      (spent_vienna d3)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at vienna d5)
      (spent_vienna d4)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at vienna d5)
      (spent_vienna d4)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at vienna d5)
      (spent_vienna d4)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at vienna d6)
      (spent_vienna d5)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at vienna d6)
      (spent_vienna d5)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at vienna d6)
      (spent_vienna d5)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at vienna d7)
      (spent_vienna d6)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at vienna d7)
      (spent_vienna d6)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at vienna d7)
      (spent_vienna d6)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at vienna d8)
      (spent_vienna d7)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at vienna d8)
      (spent_vienna d7)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at vienna d8)
      (spent_vienna d7)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at vienna d9)
      (spent_vienna d8)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at vienna d9)
      (spent_vienna d8)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at vienna d9)
      (spent_vienna d8)
      (vienna_count_3))
  )

  (:action stay_vienna_c0_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at vienna d10)
      (spent_vienna d9)
      (vienna_count_1))
  )

  (:action stay_vienna_c1_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at vienna d10)
      (spent_vienna d9)
      (vienna_count_2))
  )

  (:action stay_vienna_c2_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at vienna d10)
      (spent_vienna d9)
      (vienna_count_3))
  )

  ;; porto spend variants
  (:action stay_porto_c0_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at porto d2)
      (spent_porto d1)
      (porto_count_1))
  )

  (:action stay_porto_c1_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at porto d2)
      (spent_porto d1)
      (porto_count_2))
  )

  (:action stay_porto_c2_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at porto d2)
      (spent_porto d1)
      (porto_count_3))
  )

  (:action stay_porto_c3_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at porto d2)
      (spent_porto d1)
      (porto_count_4))
  )

  (:action stay_porto_c4_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at porto d2)
      (spent_porto d1)
      (porto_count_5))
  )

  (:action stay_porto_c0_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at porto d3)
      (spent_porto d2)
      (porto_count_1))
  )

  (:action stay_porto_c1_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at porto d3)
      (spent_porto d2)
      (porto_count_2))
  )

  (:action stay_porto_c2_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at porto d3)
      (spent_porto d2)
      (porto_count_3))
  )

  (:action stay_porto_c3_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at porto d3)
      (spent_porto d2)
      (porto_count_4))
  )

  (:action stay_porto_c4_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at porto d3)
      (spent_porto d2)
      (porto_count_5))
  )

  (:action stay_porto_c0_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at porto d4)
      (spent_porto d3)
      (porto_count_1))
  )

  (:action stay_porto_c1_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at porto d4)
      (spent_porto d3)
      (porto_count_2))
  )

  (:action stay_porto_c2_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at porto d4)
      (spent_porto d3)
      (porto_count_3))
  )

  (:action stay_porto_c3_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at porto d4)
      (spent_porto d3)
      (porto_count_4))
  )

  (:action stay_porto_c4_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at porto d4)
      (spent_porto d3)
      (porto_count_5))
  )

  (:action stay_porto_c0_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at porto d5)
      (spent_porto d4)
      (porto_count_1))
  )

  (:action stay_porto_c1_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at porto d5)
      (spent_porto d4)
      (porto_count_2))
  )

  (:action stay_porto_c2_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at porto d5)
      (spent_porto d4)
      (porto_count_3))
  )

  (:action stay_porto_c3_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at porto d5)
      (spent_porto d4)
      (porto_count_4))
  )

  (:action stay_porto_c4_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at porto d5)
      (spent_porto d4)
      (porto_count_5))
  )

  (:action stay_porto_c0_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at porto d6)
      (spent_porto d5)
      (porto_count_1))
  )

  (:action stay_porto_c1_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at porto d6)
      (spent_porto d5)
      (porto_count_2))
  )

  (:action stay_porto_c2_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at porto d6)
      (spent_porto d5)
      (porto_count_3))
  )

  (:action stay_porto_c3_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at porto d6)
      (spent_porto d5)
      (porto_count_4))
  )

  (:action stay_porto_c4_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at porto d6)
      (spent_porto d5)
      (porto_count_5))
  )

  (:action stay_porto_c0_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at porto d7)
      (spent_porto d6)
      (porto_count_1))
  )

  (:action stay_porto_c1_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at porto d7)
      (spent_porto d6)
      (porto_count_2))
  )

  (:action stay_porto_c2_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at porto d7)
      (spent_porto d6)
      (porto_count_3))
  )

  (:action stay_porto_c3_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at porto d7)
      (spent_porto d6)
      (porto_count_4))
  )

  (:action stay_porto_c4_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at porto d7)
      (spent_porto d6)
      (porto_count_5))
  )

  (:action stay_porto_c0_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at porto d8)
      (spent_porto d7)
      (porto_count_1))
  )

  (:action stay_porto_c1_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at porto d8)
      (spent_porto d7)
      (porto_count_2))
  )

  (:action stay_porto_c2_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at porto d8)
      (spent_porto d7)
      (porto_count_3))
  )

  (:action stay_porto_c3_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at porto d8)
      (spent_porto d7)
      (porto_count_4))
  )

  (:action stay_porto_c4_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at porto d8)
      (spent_porto d7)
      (porto_count_5))
  )

  (:action stay_porto_c0_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at porto d9)
      (spent_porto d8)
      (porto_count_1))
  )

  (:action stay_porto_c1_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at porto d9)
      (spent_porto d8)
      (porto_count_2))
  )

  (:action stay_porto_c2_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at porto d9)
      (spent_porto d8)
      (porto_count_3))
  )

  (:action stay_porto_c3_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at porto d9)
      (spent_porto d8)
      (porto_count_4))
  )

  (:action stay_porto_c4_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at porto d9)
      (spent_porto d8)
      (porto_count_5))
  )

  (:action stay_porto_c0_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at porto d10)
      (spent_porto d9)
      (porto_count_1))
  )

  (:action stay_porto_c1_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at porto d10)
      (spent_porto d9)
      (porto_count_2))
  )

  (:action stay_porto_c2_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at porto d10)
      (spent_porto d9)
      (porto_count_3))
  )

  (:action stay_porto_c3_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at porto d10)
      (spent_porto d9)
      (porto_count_4))
  )

  (:action stay_porto_c4_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at porto d10)
      (spent_porto d9)
      (porto_count_5))
  )

  ;; flights from prague to vienna, with workshop in window days
  (:action fly_prague_to_vienna_window_c0_d1
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at vienna d2)
      (spent_prague d1)
      (prague_count_1)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c1_d1
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at vienna d2)
      (spent_prague d1)
      (prague_count_2)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c2_d1
    :precondition (and
      (at prague d1)
      (next_day d1 d2)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d1))
      (at vienna d2)
      (spent_prague d1)
      (prague_count_3)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c0_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at vienna d3)
      (spent_prague d2)
      (prague_count_1)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c1_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at vienna d3)
      (spent_prague d2)
      (prague_count_2)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c2_d2
    :precondition (and
      (at prague d2)
      (next_day d2 d3)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d2))
      (at vienna d3)
      (spent_prague d2)
      (prague_count_3)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c0_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at vienna d4)
      (spent_prague d3)
      (prague_count_1)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c1_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at vienna d4)
      (spent_prague d3)
      (prague_count_2)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_window_c2_d3
    :precondition (and
      (at prague d3)
      (next_day d3 d4)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d3))
      (at vienna d4)
      (spent_prague d3)
      (prague_count_3)
      (workshop_attended))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at vienna d5)
      (spent_prague d4)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at vienna d5)
      (spent_prague d4)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d4
    :precondition (and
      (at prague d4)
      (next_day d4 d5)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d4))
      (at vienna d5)
      (spent_prague d4)
      (prague_count_3))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at vienna d6)
      (spent_prague d5)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at vienna d6)
      (spent_prague d5)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d5
    :precondition (and
      (at prague d5)
      (next_day d5 d6)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d5))
      (at vienna d6)
      (spent_prague d5)
      (prague_count_3))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at vienna d7)
      (spent_prague d6)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at vienna d7)
      (spent_prague d6)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d6
    :precondition (and
      (at prague d6)
      (next_day d6 d7)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d6))
      (at vienna d7)
      (spent_prague d6)
      (prague_count_3))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at vienna d8)
      (spent_prague d7)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at vienna d8)
      (spent_prague d7)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d7
    :precondition (and
      (at prague d7)
      (next_day d7 d8)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d7))
      (at vienna d8)
      (spent_prague d7)
      (prague_count_3))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at vienna d9)
      (spent_prague d8)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at vienna d9)
      (spent_prague d8)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d8
    :precondition (and
      (at prague d8)
      (next_day d8 d9)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d8))
      (at vienna d9)
      (spent_prague d8)
      (prague_count_3))
  )

  (:action fly_prague_to_vienna_nonwindow_c0_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (direct prague vienna)
      (not (prague_count_1))
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at vienna d10)
      (spent_prague d9)
      (prague_count_1))
  )

  (:action fly_prague_to_vienna_nonwindow_c1_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (direct prague vienna)
      (prague_count_1)
      (not (prague_count_2))
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at vienna d10)
      (spent_prague d9)
      (prague_count_2))
  )

  (:action fly_prague_to_vienna_nonwindow_c2_d9
    :precondition (and
      (at prague d9)
      (next_day d9 d10)
      (direct prague vienna)
      (prague_count_2)
      (not (prague_count_3)))
    :effect (and
      (not (at prague d9))
      (at vienna d10)
      (spent_prague d9)
      (prague_count_3))
  )

  ;; flights from vienna to prague
  (:action fly_vienna_to_prague_c0_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at prague d2)
      (spent_vienna d1)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at prague d2)
      (spent_vienna d1)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at prague d2)
      (spent_vienna d1)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at prague d3)
      (spent_vienna d2)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at prague d3)
      (spent_vienna d2)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at prague d3)
      (spent_vienna d2)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at prague d4)
      (spent_vienna d3)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at prague d4)
      (spent_vienna d3)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at prague d4)
      (spent_vienna d3)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at prague d5)
      (spent_vienna d4)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at prague d5)
      (spent_vienna d4)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at prague d5)
      (spent_vienna d4)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at prague d6)
      (spent_vienna d5)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at prague d6)
      (spent_vienna d5)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at prague d6)
      (spent_vienna d5)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at prague d7)
      (spent_vienna d6)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at prague d7)
      (spent_vienna d6)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at prague d7)
      (spent_vienna d6)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at prague d8)
      (spent_vienna d7)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at prague d8)
      (spent_vienna d7)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at prague d8)
      (spent_vienna d7)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at prague d9)
      (spent_vienna d8)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at prague d9)
      (spent_vienna d8)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at prague d9)
      (spent_vienna d8)
      (vienna_count_3))
  )

  (:action fly_vienna_to_prague_c0_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna prague)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at prague d10)
      (spent_vienna d9)
      (vienna_count_1))
  )

  (:action fly_vienna_to_prague_c1_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna prague)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at prague d10)
      (spent_vienna d9)
      (vienna_count_2))
  )

  (:action fly_vienna_to_prague_c2_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna prague)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at prague d10)
      (spent_vienna d9)
      (vienna_count_3))
  )

  ;; flights from vienna to porto
  (:action fly_vienna_to_porto_c0_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at porto d2)
      (spent_vienna d1)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at porto d2)
      (spent_vienna d1)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d1
    :precondition (and
      (at vienna d1)
      (next_day d1 d2)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d1))
      (at porto d2)
      (spent_vienna d1)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at porto d3)
      (spent_vienna d2)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at porto d3)
      (spent_vienna d2)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d2
    :precondition (and
      (at vienna d2)
      (next_day d2 d3)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d2))
      (at porto d3)
      (spent_vienna d2)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at porto d4)
      (spent_vienna d3)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at porto d4)
      (spent_vienna d3)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d3
    :precondition (and
      (at vienna d3)
      (next_day d3 d4)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d3))
      (at porto d4)
      (spent_vienna d3)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at porto d5)
      (spent_vienna d4)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at porto d5)
      (spent_vienna d4)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d4
    :precondition (and
      (at vienna d4)
      (next_day d4 d5)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d4))
      (at porto d5)
      (spent_vienna d4)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at porto d6)
      (spent_vienna d5)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at porto d6)
      (spent_vienna d5)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d5
    :precondition (and
      (at vienna d5)
      (next_day d5 d6)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d5))
      (at porto d6)
      (spent_vienna d5)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at porto d7)
      (spent_vienna d6)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at porto d7)
      (spent_vienna d6)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d6
    :precondition (and
      (at vienna d6)
      (next_day d6 d7)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d6))
      (at porto d7)
      (spent_vienna d6)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at porto d8)
      (spent_vienna d7)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at porto d8)
      (spent_vienna d7)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d7
    :precondition (and
      (at vienna d7)
      (next_day d7 d8)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d7))
      (at porto d8)
      (spent_vienna d7)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at porto d9)
      (spent_vienna d8)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at porto d9)
      (spent_vienna d8)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d8
    :precondition (and
      (at vienna d8)
      (next_day d8 d9)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d8))
      (at porto d9)
      (spent_vienna d8)
      (vienna_count_3))
  )

  (:action fly_vienna_to_porto_c0_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna porto)
      (not (vienna_count_1))
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at porto d10)
      (spent_vienna d9)
      (vienna_count_1))
  )

  (:action fly_vienna_to_porto_c1_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna porto)
      (vienna_count_1)
      (not (vienna_count_2))
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at porto d10)
      (spent_vienna d9)
      (vienna_count_2))
  )

  (:action fly_vienna_to_porto_c2_d9
    :precondition (and
      (at vienna d9)
      (next_day d9 d10)
      (direct vienna porto)
      (vienna_count_2)
      (not (vienna_count_3)))
    :effect (and
      (not (at vienna d9))
      (at porto d10)
      (spent_vienna d9)
      (vienna_count_3))
  )

  ;; flights from porto to vienna
  (:action fly_porto_to_vienna_c0_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at vienna d2)
      (spent_porto d1)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at vienna d2)
      (spent_porto d1)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at vienna d2)
      (spent_porto d1)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at vienna d2)
      (spent_porto d1)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d1
    :precondition (and
      (at porto d1)
      (next_day d1 d2)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d1))
      (at vienna d2)
      (spent_porto d1)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at vienna d3)
      (spent_porto d2)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at vienna d3)
      (spent_porto d2)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at vienna d3)
      (spent_porto d2)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at vienna d3)
      (spent_porto d2)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d2
    :precondition (and
      (at porto d2)
      (next_day d2 d3)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d2))
      (at vienna d3)
      (spent_porto d2)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at vienna d4)
      (spent_porto d3)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at vienna d4)
      (spent_porto d3)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at vienna d4)
      (spent_porto d3)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at vienna d4)
      (spent_porto d3)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d3
    :precondition (and
      (at porto d3)
      (next_day d3 d4)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d3))
      (at vienna d4)
      (spent_porto d3)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at vienna d5)
      (spent_porto d4)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at vienna d5)
      (spent_porto d4)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at vienna d5)
      (spent_porto d4)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at vienna d5)
      (spent_porto d4)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d4
    :precondition (and
      (at porto d4)
      (next_day d4 d5)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d4))
      (at vienna d5)
      (spent_porto d4)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at vienna d6)
      (spent_porto d5)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at vienna d6)
      (spent_porto d5)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at vienna d6)
      (spent_porto d5)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at vienna d6)
      (spent_porto d5)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d5
    :precondition (and
      (at porto d5)
      (next_day d5 d6)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d5))
      (at vienna d6)
      (spent_porto d5)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at vienna d7)
      (spent_porto d6)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at vienna d7)
      (spent_porto d6)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at vienna d7)
      (spent_porto d6)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at vienna d7)
      (spent_porto d6)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d6
    :precondition (and
      (at porto d6)
      (next_day d6 d7)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d6))
      (at vienna d7)
      (spent_porto d6)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at vienna d8)
      (spent_porto d7)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at vienna d8)
      (spent_porto d7)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at vienna d8)
      (spent_porto d7)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at vienna d8)
      (spent_porto d7)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d7
    :precondition (and
      (at porto d7)
      (next_day d7 d8)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d7))
      (at vienna d8)
      (spent_porto d7)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at vienna d9)
      (spent_porto d8)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at vienna d9)
      (spent_porto d8)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at vienna d9)
      (spent_porto d8)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at vienna d9)
      (spent_porto d8)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d8
    :precondition (and
      (at porto d8)
      (next_day d8 d9)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d8))
      (at vienna d9)
      (spent_porto d8)
      (porto_count_5))
  )

  (:action fly_porto_to_vienna_c0_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (direct porto vienna)
      (not (porto_count_1))
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at vienna d10)
      (spent_porto d9)
      (porto_count_1))
  )

  (:action fly_porto_to_vienna_c1_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (direct porto vienna)
      (porto_count_1)
      (not (porto_count_2))
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at vienna d10)
      (spent_porto d9)
      (porto_count_2))
  )

  (:action fly_porto_to_vienna_c2_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (direct porto vienna)
      (porto_count_2)
      (not (porto_count_3))
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at vienna d10)
      (spent_porto d9)
      (porto_count_3))
  )

  (:action fly_porto_to_vienna_c3_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (direct porto vienna)
      (porto_count_3)
      (not (porto_count_4))
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at vienna d10)
      (spent_porto d9)
      (porto_count_4))
  )

  (:action fly_porto_to_vienna_c4_d9
    :precondition (and
      (at porto d9)
      (next_day d9 d10)
      (direct porto vienna)
      (porto_count_4)
      (not (porto_count_5)))
    :effect (and
      (not (at porto d9))
      (at vienna d10)
      (spent_porto d9)
      (porto_count_5))
  )
)