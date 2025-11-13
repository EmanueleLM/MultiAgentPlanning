(define (domain MeetingPlanningExample9)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location tick)

  (:predicates
    (at ?loc - location ?t - tick)        ; traveler assigned to be at location during tick
    (occupied ?t - tick)                  ; traveler is assigned (in some state) during tick
    (succ ?t1 - tick ?t2 - tick)          ; immediate successor relation on ticks
    (meeting_done)                        ; goal flag: a contiguous 15-tick meeting has been scheduled
  )

  ;; Wait one tick at the same location: if traveler is at ?loc at tick ?t, and the next tick ?t2 is free,
  ;; then occupy ?t2 and mark traveler at ?loc at ?t2.
  (:action wait
    :parameters (?loc - location ?t - tick ?t2 - tick)
    :precondition (and
      (at ?loc ?t)
      (succ ?t ?t2)
      (not (occupied ?t2))
    )
    :effect (and
      (at ?loc ?t2)
      (occupied ?t2)
    )
  )

  ;; Move from Union Square to Nob Hill: duration 2 ticks (rounded up from 9 minutes -> 10 minutes).
  ;; Requires start tick ?t, and two successive free ticks ?t1 and ?t2; occupies those ticks and places traveler
  ;; at nob_hill at arrival tick ?t2.
  (:action move_union_square_to_nob_hill
    :parameters (?t - tick ?t1 - tick ?t2 - tick)
    :precondition (and
      (at union_square ?t)
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

  ;; Move from Nob Hill to Union Square: duration 2 ticks (rounded up from 7 minutes -> 10 minutes).
  (:action move_nob_hill_to_union_square
    :parameters (?t - tick ?t1 - tick ?t2 - tick)
    :precondition (and
      (at nob_hill ?t)
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

  ;; Schedule a contiguous 15-tick meeting with Mary starting at tick ?s.
  ;; Preconditions:
  ;;  - traveler is at nob_hill at tick ?s and tick ?s is already occupied (so traveler is present at start),
  ;;  - the next 14 successor ticks ?t1..?t14 are free (not occupied).
  ;; Effects:
  ;;  - mark traveler at nob_hill for each of those 14 successor ticks and occupy them,
  ;;  - set meeting_done flag.
  ;; This enforces contiguous meeting of 15 ticks (including the start tick ?s).
  (:action meet_mary_15ticks
    :parameters (?s - tick
                 ?t1 - tick ?t2 - tick ?t3 - tick ?t4 - tick ?t5 - tick
                 ?t6 - tick ?t7 - tick ?t8 - tick ?t9 - tick ?t10 - tick
                 ?t11 - tick ?t12 - tick ?t13 - tick ?t14 - tick)
    :precondition (and
      (at nob_hill ?s)
      (occupied ?s)
      (succ ?s ?t1)
      (succ ?t1 ?t2)
      (succ ?t2 ?t3)
      (succ ?t3 ?t4)
      (succ ?t4 ?t5)
      (succ ?t5 ?t6)
      (succ ?t6 ?t7)
      (succ ?t7 ?t8)
      (succ ?t8 ?t9)
      (succ ?t9 ?t10)
      (succ ?t10 ?t11)
      (succ ?t11 ?t12)
      (succ ?t12 ?t13)
      (succ ?t13 ?t14)
      (not (occupied ?t1))
      (not (occupied ?t2))
      (not (occupied ?t3))
      (not (occupied ?t4))
      (not (occupied ?t5))
      (not (occupied ?t6))
      (not (occupied ?t7))
      (not (occupied ?t8))
      (not (occupied ?t9))
      (not (occupied ?t10))
      (not (occupied ?t11))
      (not (occupied ?t12))
      (not (occupied ?t13))
      (not (occupied ?t14))
    )
    :effect (and
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