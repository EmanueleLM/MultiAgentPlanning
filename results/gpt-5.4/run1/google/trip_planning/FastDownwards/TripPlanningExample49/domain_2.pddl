(define (domain european_trip_13_days_min_init)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    need
    stay_need flight_need split_need - need
  )

  (:predicates
    (at ?c - city)

    (need_open ?n - need)
    (need_done ?n - need)

    (remaining_after_1)
    (remaining_after_2)
    (remaining_after_3)
    (remaining_after_4)
    (remaining_after_5)
    (remaining_after_6)
    (remaining_after_7)
    (remaining_after_8)
    (remaining_after_9)
    (remaining_after_10)
    (remaining_after_11)
    (remaining_after_12)

    (rk_left_5)
    (rk_left_4)
    (rk_left_3)
    (rk_left_2)
    (rk_left_1)

    (mi_left_7)
    (mi_left_6)
    (mi_left_5)
    (mi_left_4)
    (mi_left_3)
    (mi_left_2)
    (mi_left_1)

    (sp_left_3)
    (sp_left_2)
    (sp_left_1)

    (split_window_open_1)
    (split_window_open_2)
    (split_window_open_3)
  )

  ;; day progression actions
  (:action stay_reykjavik
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rk_stay)
      (remaining_after_1)
      (rk_left_5))
    :effect (and
      (not (rk_left_5))
      (rk_left_4)
      (not (remaining_after_1))
      (remaining_after_2))
  )

  (:action stay_reykjavik_2
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rk_stay)
      (remaining_after_2)
      (rk_left_4))
    :effect (and
      (not (rk_left_4))
      (rk_left_3)
      (not (remaining_after_2))
      (remaining_after_3))
  )

  (:action stay_reykjavik_3
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rk_stay)
      (remaining_after_3)
      (rk_left_3))
    :effect (and
      (not (rk_left_3))
      (rk_left_2)
      (not (remaining_after_3))
      (remaining_after_4))
  )

  (:action stay_reykjavik_4
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rk_stay)
      (remaining_after_4)
      (rk_left_2))
    :effect (and
      (not (rk_left_2))
      (rk_left_1)
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action stay_reykjavik_5
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rk_stay)
      (remaining_after_5)
      (rk_left_1))
    :effect (and
      (not (rk_left_1))
      (need_done rk_stay)
      (not (need_open rk_stay))
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action stay_milan
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_1)
      (mi_left_7))
    :effect (and
      (not (mi_left_7))
      (mi_left_6)
      (not (remaining_after_1))
      (remaining_after_2))
  )

  (:action stay_milan_2
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_2)
      (mi_left_6))
    :effect (and
      (not (mi_left_6))
      (mi_left_5)
      (not (remaining_after_2))
      (remaining_after_3))
  )

  (:action stay_milan_3
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_3)
      (mi_left_5))
    :effect (and
      (not (mi_left_5))
      (mi_left_4)
      (not (remaining_after_3))
      (remaining_after_4))
  )

  (:action stay_milan_4
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_4)
      (mi_left_4))
    :effect (and
      (not (mi_left_4))
      (mi_left_3)
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action stay_milan_5
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_5)
      (mi_left_3))
    :effect (and
      (not (mi_left_3))
      (mi_left_2)
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action stay_milan_6
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_6)
      (mi_left_2))
    :effect (and
      (not (mi_left_2))
      (mi_left_1)
      (not (remaining_after_6))
      (remaining_after_7))
  )

  (:action stay_milan_7
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mi_stay)
      (remaining_after_7)
      (mi_left_1))
    :effect (and
      (not (mi_left_1))
      (need_done mi_stay)
      (not (need_open mi_stay))
      (not (remaining_after_7))
      (remaining_after_8))
  )

  (:action stay_split
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_1)
      (sp_left_3))
    :effect (and
      (not (sp_left_3))
      (sp_left_2)
      (not (remaining_after_1))
      (remaining_after_2)
      (need_done split_window))
  )

  (:action stay_split_2
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_2)
      (sp_left_2))
    :effect (and
      (not (sp_left_2))
      (sp_left_1)
      (not (remaining_after_2))
      (remaining_after_3)
      (need_done split_window))
  )

  (:action stay_split_3
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_3)
      (sp_left_1))
    :effect (and
      (not (sp_left_1))
      (need_done sp_stay)
      (not (need_open sp_stay))
      (not (remaining_after_3))
      (remaining_after_4)
      (need_done split_window))
  )

  (:action stay_split_late_1
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_4)
      (sp_left_3))
    :effect (and
      (not (sp_left_3))
      (sp_left_2)
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action stay_split_late_2
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_5)
      (sp_left_2))
    :effect (and
      (not (sp_left_2))
      (sp_left_1)
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action stay_split_late_3
    :parameters ()
    :precondition (and
      (at split)
      (need_open sp_stay)
      (remaining_after_6)
      (sp_left_1))
    :effect (and
      (not (sp_left_1))
      (need_done sp_stay)
      (not (need_open sp_stay))
      (not (remaining_after_6))
      (remaining_after_7))
  )

  ;; direct flights only: milan <-> reykjavik, milan <-> split
  (:action fly_milan_to_reykjavik_1
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_1))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_1))
      (remaining_after_2))
  )

  (:action fly_milan_to_reykjavik_2
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_2))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_2))
      (remaining_after_3))
  )

  (:action fly_milan_to_reykjavik_3
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_3))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_3))
      (remaining_after_4))
  )

  (:action fly_milan_to_reykjavik_4
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_4))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action fly_milan_to_reykjavik_5
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_5))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action fly_milan_to_reykjavik_6
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_6))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_6))
      (remaining_after_7))
  )

  (:action fly_milan_to_reykjavik_7
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_7))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_7))
      (remaining_after_8))
  )

  (:action fly_milan_to_reykjavik_8
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_8))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_8))
      (remaining_after_9))
  )

  (:action fly_milan_to_reykjavik_9
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_9))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_9))
      (remaining_after_10))
  )

  (:action fly_milan_to_reykjavik_10
    :parameters ()
    :precondition (and
      (at milan)
      (need_open mr_flight)
      (remaining_after_10))
    :effect (and
      (not (at milan))
      (at reykjavik)
      (need_done mr_flight)
      (not (need_open mr_flight))
      (not (remaining_after_10))
      (remaining_after_11))
  )

  (:action fly_milan_to_split_1
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_1))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_1))
      (remaining_after_2)
      (need_done split_window))
  )

  (:action fly_milan_to_split_2
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_2))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_2))
      (remaining_after_3)
      (need_done split_window))
  )

  (:action fly_milan_to_split_3
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_3))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_3))
      (remaining_after_4)
      (need_done split_window))
  )

  (:action fly_milan_to_split_4
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_4))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action fly_milan_to_split_5
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_5))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action fly_milan_to_split_6
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_6))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_6))
      (remaining_after_7))
  )

  (:action fly_milan_to_split_7
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_7))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_7))
      (remaining_after_8))
  )

  (:action fly_milan_to_split_8
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_8))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_8))
      (remaining_after_9))
  )

  (:action fly_milan_to_split_9
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_9))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_9))
      (remaining_after_10))
  )

  (:action fly_milan_to_split_10
    :parameters ()
    :precondition (and
      (at milan)
      (need_open ms_flight)
      (remaining_after_10))
    :effect (and
      (not (at milan))
      (at split)
      (need_done ms_flight)
      (not (need_open ms_flight))
      (not (remaining_after_10))
      (remaining_after_11))
  )

  (:action fly_reykjavik_to_milan_1
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_1))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_1))
      (remaining_after_2))
  )

  (:action fly_reykjavik_to_milan_2
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_2))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_2))
      (remaining_after_3))
  )

  (:action fly_reykjavik_to_milan_3
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_3))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_3))
      (remaining_after_4))
  )

  (:action fly_reykjavik_to_milan_4
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_4))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action fly_reykjavik_to_milan_5
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_5))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action fly_reykjavik_to_milan_6
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_6))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_6))
      (remaining_after_7))
  )

  (:action fly_reykjavik_to_milan_7
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_7))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_7))
      (remaining_after_8))
  )

  (:action fly_reykjavik_to_milan_8
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_8))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_8))
      (remaining_after_9))
  )

  (:action fly_reykjavik_to_milan_9
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_9))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_9))
      (remaining_after_10))
  )

  (:action fly_reykjavik_to_milan_10
    :parameters ()
    :precondition (and
      (at reykjavik)
      (need_open rm_flight)
      (remaining_after_10))
    :effect (and
      (not (at reykjavik))
      (at milan)
      (need_done rm_flight)
      (not (need_open rm_flight))
      (not (remaining_after_10))
      (remaining_after_11))
  )

  (:action fly_split_to_milan_1
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_1))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_1))
      (remaining_after_2))
  )

  (:action fly_split_to_milan_2
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_2))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_2))
      (remaining_after_3))
  )

  (:action fly_split_to_milan_3
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_3))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_3))
      (remaining_after_4))
  )

  (:action fly_split_to_milan_4
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_4))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_4))
      (remaining_after_5))
  )

  (:action fly_split_to_milan_5
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_5))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_5))
      (remaining_after_6))
  )

  (:action fly_split_to_milan_6
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_6))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_6))
      (remaining_after_7))
  )

  (:action fly_split_to_milan_7
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_7))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_7))
      (remaining_after_8))
  )

  (:action fly_split_to_milan_8
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_8))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_8))
      (remaining_after_9))
  )

  (:action fly_split_to_milan_9
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_9))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_9))
      (remaining_after_10))
  )

  (:action fly_split_to_milan_10
    :parameters ()
    :precondition (and
      (at split)
      (need_open sm_flight)
      (remaining_after_10))
    :effect (and
      (not (at split))
      (at milan)
      (need_done sm_flight)
      (not (need_open sm_flight))
      (not (remaining_after_10))
      (remaining_after_11))
  )

  ;; open next required subgoal
  (:action open_mr_flight
    :parameters ()
    :precondition (and
      (need_done mi_stay)
      (need_done sm_flight)
      (not (need_open mr_flight))
      (not (need_done mr_flight)))
    :effect (and
      (need_open mr_flight))
  )

  (:action open_rk_stay
    :parameters ()
    :precondition (and
      (need_done mr_flight)
      (not (need_open rk_stay))
      (not (need_done rk_stay)))
    :effect (and
      (need_open rk_stay))
  )

  (:action open_rm_flight
    :parameters ()
    :precondition (and
      (need_done rk_stay)
      (not (need_open rm_flight))
      (not (need_done rm_flight)))
    :effect (and
      (need_open rm_flight))
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (need_done sm_flight)
      (need_done mi_stay)
      (need_done mr_flight)
      (need_done rk_stay)
      (need_done rm_flight)
      (need_done sp_stay)
      (need_done split_window)
      (remaining_after_12)
      (at milan))
    :effect (and
      (need_done finished))
  )
)