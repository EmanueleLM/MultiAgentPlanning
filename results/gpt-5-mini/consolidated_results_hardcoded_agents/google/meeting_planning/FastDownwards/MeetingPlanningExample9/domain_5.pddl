(define (domain meeting_planning_example9)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location tick)

  (:predicates
    (at ?loc - location ?t - tick)        ; traveler is at location at tick
    (occupied ?t - tick)                  ; tick is consumed/occupied by traveler
    (succ ?t1 - tick ?t2 - tick)          ; immediate successor relation on ticks
    (mary_present ?t - tick)              ; Mary is present at Nob Hill at tick
    (meeting_done)                        ; goal flag: contiguous 15-tick meeting scheduled
  )

  ;; Wait one tick (5 minutes) at the same location.
  (:action wait_5
    :parameters (?loc - location ?t - tick ?t2 - tick)
    :precondition (and
      (at ?loc ?t)
      (occupied ?t)
      (succ ?t ?t2)
      (not (occupied ?t2))
    )
    :effect (and
      (at ?loc ?t2)
      (occupied ?t2)
    )
  )

  ;; Move from union_square to nob_hill.
  ;; Travel time 9 minutes rounded up to 10 minutes = 2 ticks.
  (:action move_union_square_to_nob_hill_9
    :parameters (?t - tick ?t1 - tick ?t2 - tick)
    :precondition (and
      (at union_square ?t)
      (occupied ?t)
      (succ ?t ?t1)
      (succ ?t1 ?t2)
      (not (occupied ?t1))
      (not (occupied ?t2))
    )
    :effect (and
      (at nob_hill ?t2)
      (occupied ?t1)
      (occupied ?t2)
    )
  )

  ;; Move from nob_hill to union_square.
  ;; Travel time 7 minutes rounded up to 10 minutes = 2 ticks.
  (:action move_nob_hill_to_union_square_7
    :parameters (?t - tick ?t1 - tick ?t2 - tick)
    :precondition (and
      (at nob_hill ?t)
      (occupied ?t)
      (succ ?t ?t1)
      (succ ?t1 ?t2)
      (not (occupied ?t1))
      (not (occupied ?t2))
    )
    :effect (and
      (at union_square ?t2)
      (occupied ?t1)
      (occupied ?t2)
    )
  )

  ;; Schedule a contiguous 15-tick (75-minute) meeting with Mary starting at tick ?s.
  ;; Enforces that Mary is present for every tick of the block and that none of those successor ticks
  ;; are previously occupied. Sets meeting_done when the block is reserved.
  (:action meet_mary_15ticks
    :parameters (?s - tick
                 ?t1 - tick ?t2 - tick ?t3 - tick ?t4 - tick ?t5 - tick
                 ?t6 - tick ?t7 - tick ?t8 - tick ?t9 - tick ?t10 - tick
                 ?t11 - tick ?t12 - tick ?t13 - tick ?t14 - tick)
    :precondition (and
      (at nob_hill ?s)
      (occupied ?s)
      (mary_present ?s)
      (succ ?s ?t1) (mary_present ?t1) (not (occupied ?t1))
      (succ ?t1 ?t2) (mary_present ?t2) (not (occupied ?t2))
      (succ ?t2 ?t3) (mary_present ?t3) (not (occupied ?t3))
      (succ ?t3 ?t4) (mary_present ?t4) (not (occupied ?t4))
      (succ ?t4 ?t5) (mary_present ?t5) (not (occupied ?t5))
      (succ ?t5 ?t6) (mary_present ?t6) (not (occupied ?t6))
      (succ ?t6 ?t7) (mary_present ?t7) (not (occupied ?t7))
      (succ ?t7 ?t8) (mary_present ?t8) (not (occupied ?t8))
      (succ ?t8 ?t9) (mary_present ?t9) (not (occupied ?t9))
      (succ ?t9 ?t10) (mary_present ?t10) (not (occupied ?t10))
      (succ ?t10 ?t11) (mary_present ?t11) (not (occupied ?t11))
      (succ ?t11 ?t12) (mary_present ?t12) (not (occupied ?t12))
      (succ ?t12 ?t13) (mary_present ?t13) (not (occupied ?t13))
      (succ ?t13 ?t14) (mary_present ?t14) (not (occupied ?t14))
    )
    :effect (and
      ;; occupy the 14 successor ticks and assert location during them
      (at nob_hill ?t1) (occupied ?t1)
      (at nob_hill ?t2) (occupied ?t2)
      (at nob_hill ?t3) (occupied ?t3)
      (at nob_hill ?t4) (occupied ?t4)
      (at nob_hill ?t5) (occupied ?t5)
      (at nob_hill ?t6) (occupied ?t6)
      (at nob_hill ?t7) (occupied ?t7)
      (at nob_hill ?t8) (occupied ?t8)
      (at nob_hill ?t9) (occupied ?t9)
      (at nob_hill ?t10) (occupied ?t10)
      (at nob_hill ?t11) (occupied ?t11)
      (at nob_hill ?t12) (occupied ?t12)
      (at nob_hill ?t13) (occupied ?t13)
      (at nob_hill ?t14) (occupied ?t14)
      (meeting_done)
    )
  )
)