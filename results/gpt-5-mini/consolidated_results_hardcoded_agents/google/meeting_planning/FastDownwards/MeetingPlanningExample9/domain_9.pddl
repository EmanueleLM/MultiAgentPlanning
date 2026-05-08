(define (domain meeting_planning_example9)
  (:requirements :strips :typing :negative-preconditions)
  (:types location tick)

  ;; Known location constants.
  (:constants union_square nob_hill - location)

  (:predicates
    ;; traveler at a location at a given tick
    (at ?loc - location ?t - tick)
    ;; tick occupied by traveler (prevents other actions that require free ticks)
    (occupied ?t - tick)
    ;; immediate successor tick relation (one 5-minute increment)
    (succ ?t1 - tick ?t2 - tick)
    ;; Mary present at a location at a tick
    (mary_at ?loc - location ?t - tick)
    ;; goal marker for a contiguous 15-tick (75-minute) meeting block
    (meeting_done)
  )

  ;; Wait one tick (5 minutes) staying at the same location.
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

  ;; Move from Union Square to Nob Hill taking exactly 2 ticks (ceil(9/5)=2).
  ;; Enforces contiguous unoccupied ticks for transit and places traveler at destination at the end tick.
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

  ;; Move from Nob Hill to Union Square taking exactly 2 ticks (ceil(7/5)=2).
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

  ;; Schedule a contiguous 15-tick (75-minute) meeting with Mary starting at ?s.
  ;; Enforces Mary presence for every tick in the block and contiguous unoccupied ticks.
  (:action meet_mary_15ticks
    :parameters (?loc - location
                 ?s - tick
                 ?t1 - tick ?t2 - tick ?t3 - tick ?t4 - tick ?t5 - tick
                 ?t6 - tick ?t7 - tick ?t8 - tick ?t9 - tick ?t10 - tick
                 ?t11 - tick ?t12 - tick ?t13 - tick ?t14 - tick)
    :precondition (and
      ;; traveler is present and occupies the start tick
      (at ?loc ?s)
      (occupied ?s)
      ;; Mary present at start and every tick of the block
      (mary_at ?loc ?s)
      (succ ?s ?t1)  (mary_at ?loc ?t1)  (not (occupied ?t1))
      (succ ?t1 ?t2) (mary_at ?loc ?t2)  (not (occupied ?t2))
      (succ ?t2 ?t3) (mary_at ?loc ?t3)  (not (occupied ?t3))
      (succ ?t3 ?t4) (mary_at ?loc ?t4)  (not (occupied ?t4))
      (succ ?t4 ?t5) (mary_at ?loc ?t5)  (not (occupied ?t5))

      (succ ?t5 ?t6)  (mary_at ?loc ?t6)  (not (occupied ?t6))
      (succ ?t6 ?t7)  (mary_at ?loc ?t7)  (not (occupied ?t7))
      (succ ?t7 ?t8)  (mary_at ?loc ?t8)  (not (occupied ?t8))
      (succ ?t8 ?t9)  (mary_at ?loc ?t9)  (not (occupied ?t9))
      (succ ?t9 ?t10) (mary_at ?loc ?t10) (not (occupied ?t10))

      (succ ?t10 ?t11) (mary_at ?loc ?t11) (not (occupied ?t11))
      (succ ?t11 ?t12) (mary_at ?loc ?t12) (not (occupied ?t12))
      (succ ?t12 ?t13) (mary_at ?loc ?t13) (not (occupied ?t13))
      (succ ?t13 ?t14) (mary_at ?loc ?t14) (not (occupied ?t14))
    )
    :effect (and
      ;; occupy and assert at-location for each successor tick of the meeting block
      (at ?loc ?t1) (occupied ?t1)
      (at ?loc ?t2) (occupied ?t2)
      (at ?loc ?t3) (occupied ?t3)
      (at ?loc ?t4) (occupied ?t4)
      (at ?loc ?t5) (occupied ?t5)

      (at ?loc ?t6) (occupied ?t6)
      (at ?loc ?t7) (occupied ?t7)
      (at ?loc ?t8) (occupied ?t8)
      (at ?loc ?t9) (occupied ?t9)
      (at ?loc ?t10) (occupied ?t10)

      (at ?loc ?t11) (occupied ?t11)
      (at ?loc ?t12) (occupied ?t12)
      (at ?loc ?t13) (occupied ?t13)
      (at ?loc ?t14) (occupied ?t14)

      ;; mark meeting goal achieved
      (meeting_done)
    )
  )
)